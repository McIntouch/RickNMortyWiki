//
//  RMRequest.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import Foundation

/// a class to form an API path
final class RMRequest {
    struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api/"
    }
    let endpoint:RMEndpoint
    var pathComponents:[String]
    var queryParameters: [URLQueryItem]
    
    var urlString: String {
        var string = Constants.baseURL
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
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
    
    init(endpoint: RMEndpoint, pathComponents: [String] = [] , queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url:URL){
        let string = url.absoluteString
                if !string.contains(Constants.baseURL) {
                    return nil
                }
                let trimmed = string.replacingOccurrences(of: Constants.baseURL, with: "")
                if trimmed.contains("/") {
                    let components = trimmed.components(separatedBy: "/")
                    if !components.isEmpty {
                        let endpointString = components[0] // Endpoint
                        var pathComponents: [String] = []
                        if components.count > 1 {
                            pathComponents = components
                            pathComponents.removeFirst()
                        }
                        if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                            self.init(endpoint: rmEndpoint, pathComponents: pathComponents)
                            return
                        }
                    }
                } else if trimmed.contains("?") {
                    let components = trimmed.components(separatedBy: "?")
                    if !components.isEmpty, components.count >= 2 {
                        let endpointString = components[0]
                        let queryItemsString = components[1]
                        // value=name&value=name
                        let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                            guard $0.contains("=") else {
                                return nil
                            }
                            let parts = $0.components(separatedBy: "=")

                            return URLQueryItem(
                                name: parts[0],
                                value: parts[1]
                            )
                        })

                        if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                            self.init(endpoint: rmEndpoint, queryParameters: queryItems)
                            return
                        }
                    }
                }
                return nil
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
