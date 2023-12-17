//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 16/12/2566 BE.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let value:String
    private let title:String
    
    init(
        value:String,
        title:String
    ) {
        self.value = value
        self.title = title
    }
}
