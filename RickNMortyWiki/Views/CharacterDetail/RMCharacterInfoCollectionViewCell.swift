//
//  RMCharacterInfoCollectionViewCell.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 16/12/2566 BE.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        
    }
    
    private func setUpConstraints(){
        
    }
    
    public func configure(with: RMCharacterInfoCollectionViewCellViewModel){
        
    }
}
