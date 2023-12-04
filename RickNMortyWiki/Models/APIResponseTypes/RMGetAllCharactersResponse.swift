//
//  RMGetAllCharacterResponse.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMCharacter]
}
