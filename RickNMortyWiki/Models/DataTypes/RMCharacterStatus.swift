//
//  RMCharacterStatus.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"

    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
