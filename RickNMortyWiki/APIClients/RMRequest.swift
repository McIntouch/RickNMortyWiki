//
//  RMRequest.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import Foundation

/// a class to form an API path
final class RMRequest {
    struct Constant {
        static let baseURL = "https://rickandmortyapi.com/api/"
    }
    let endpoint:RMEndpoint
    var pathComponent:[String]
    var queryParameters: [URLQueryItem]
    
    var urlString: String {
        var string = Constant.baseURL
        string += endpoint.rawValue
        
        if !pathComponent.isEmpty {
            pathComponent.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty {
            string += "/?"
            let argumentListString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentListString
        }
        return string
    }
    
    /// constructed API url from urlString above
    public var url : URL? {
        return URL(string: urlString)
    }
    
    /// http method
    public let httpMethod = "GET"
    
    init(endpoint: RMEndpoint, pathComponent: [String] = [] , queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponent = pathComponent
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
