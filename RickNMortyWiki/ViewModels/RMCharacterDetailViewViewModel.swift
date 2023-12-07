//
//  RMCharacterDetailViewViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 7/12/2566 BE.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title:String{
        character.name
    }
}
