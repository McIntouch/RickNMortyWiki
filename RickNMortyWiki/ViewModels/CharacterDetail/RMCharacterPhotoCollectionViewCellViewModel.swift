//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 16/12/2566 BE.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    
    private let imageURL: URL?
    
    init(imageURL:URL?) {
        self.imageURL = imageURL
        
    }
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void){
        guard let imageURL = self.imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageURL, completion: completion)
    }
}
