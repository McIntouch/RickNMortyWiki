//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 16/12/2566 BE.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let type: `Type`
    private let value: String
    public var title: String {
        type.displayTitle
    }
    
    static let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
           formatter.timeZone = .current
           return formatter
       }()

       static let shortDateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           formatter.timeStyle = .short
           formatter.timeZone = .current
           return formatter
       }()
    
    public var displayValue:String {
        if self.value.isEmpty { return "N/A"}
        
        if let date = Self.dateFormatter.date(from: value),
                   type == .created {
                    return Self.shortDateFormatter.string(from: date)
                }
        
        return self.value
    }
    public var iconImage:UIImage? {
        type.iconImage
    }
    
    public var tintColor:UIColor {
        type.tintColor
    }
    
    public var titleTextColor:UIColor {
        type.titleTextColor
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount
        
        var displayTitle:String {
            switch self {
            case .status,
            .gender,
            .type,
            .species,
            .origin,
            .location,
            .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "EPISODE COUNT"
            }
            
        }
        
        var iconImage:UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
        
        var tintColor:UIColor {
            switch self {
            case .status:
                return .systemRed
            case .gender:
                return .systemOrange
            case .type:
                return .systemYellow
            case .species:
                return .systemGreen
            case .origin:
                return .systemCyan
            case .location:
                return .systemBlue
            case .created:
                return .systemIndigo
            case .episodeCount:
                return .systemPurple
            }
        }
        
        var titleTextColor:UIColor {
            switch self {
            case .status:
                return .systemRed
            case .gender:
                return .systemOrange
            case .type:
                return .systemYellow
            case .species:
                return .systemGreen
            case .origin:
                return .systemCyan
            case .location:
                return .systemBlue
            case .created:
                return .systemIndigo
            case .episodeCount:
                return .systemPurple
            }
        }
    }
    init(type: `Type`, value: String) {
        self.value = value
        self.type = type
    }
}

   
