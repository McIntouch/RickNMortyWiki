//
//  RMService.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import Foundation

/// a class to make an API call
final class RMService {
    //create a shared sigleton instance
    static let  shared = RMService()
    
    /// privatize the init constructer
    private init() {}
    
    //enum error types
    enum RMServiceError : Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send an API call
    /// - Parameters:
    ///   - request: request url
    ///   - type: type of the object we want to getback
    ///   - completion: a callback with data or error
    public func execute<T: Codable >(request: RMRequest, expecting type: T.Type ,completion: @escaping (Result<T,Error>) -> Void){
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest){ data, _ , error  in
            guard let data = data, error  == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
        
            //decode the responsed data
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    //MARK: - private
    private func request(from rmRequest : RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
