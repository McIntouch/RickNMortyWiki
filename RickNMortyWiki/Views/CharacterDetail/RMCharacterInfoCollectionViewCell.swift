//
//  RMCharacterInfoCollectionViewCell.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 16/12/2566 BE.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    private let valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = .systemFont(ofSize: 20, weight: .light)
        valueLabel.text =  "earth"
        return valueLabel
    }()
    
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "globe.americas.fill")
        return icon
    }()
    
    
    private let titleLabel: UILabel = {
        let titleLabel =  UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel.text = "location"
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let titleContainerView: UIView = {
        let titleContainer = UIView()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.backgroundColor = .secondarySystemBackground
        return titleContainer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(titleContainerView,valueLabel,iconImageView)
        titleContainerView.addSubview(titleLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor ,multiplier: 0.33),
            
            titleLabel.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 35),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 35),
            valueLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor,constant: 10),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
    }
    
    public func configure(with: RMCharacterInfoCollectionViewCellViewModel){
        
    }
}
