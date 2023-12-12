//
//  RMImageLoader.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 12/12/2566 BE.
//

import Foundation

final class RMImageLoader {
    //singleton object
    static let shared = RMImageLoader()
    
    private var imageCache = NSCache<NSString,NSData>()
    
    private init() {}
    
    /// a function to load image and catch 'em
    /// - Parameters:
    ///   - url: url of image
    ///   - completion: a callback for the function
    public func downloadImage(_ url :URL,completion: @escaping (Result<Data,Error>) -> Void){
        
        let key = url.absoluteString as NSString
        
        //if there're images for the characters in the cached, return those image.no need to call an api again.
        if let data = imageCache.object(forKey: key) {
            completion(.success(data as Data))
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
        
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            // cach the image with its corresponding key into ImageCache collection
            self?.imageCache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
