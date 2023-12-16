//
//  RMCharacterDetailViewViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 7/12/2566 BE.
//

import UIKit

final class RMCharacterDetailViewViewModel: NSObject {
    
    private let character: RMCharacter
    public var sections: [SectionType] = []
    
    public var title:String{
        character.name
    }
    
    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case information(viewModels: [RMCharacterInfoCollectionViewCellViewModel])
        case episode(viewModels: [RMCharacterEpisodeCollectionViewCellViewModel])
    }
    
    init(character: RMCharacter) {
        self.character = character
        super.init()
        setUpSections()
    }
    
    private func setUpSections() {
        sections = [
            .photo(viewModel: .init()),
            .information(viewModels: [.init(),.init(),.init(),.init()]),
            .episode(viewModels: [.init(),.init(),.init(),.init()]),
        ]
    }
    
    //MARK: - Set up each group of the collection view
    public func createPhotoSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            ),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }

    public func createInformationSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 2, bottom: 10, trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)
            ),
            subitems: [item,item,item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createEpisodeSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(150)
            ),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}

extension RMCharacterDetailViewViewModel : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let sectionType = self.sections[section]
        switch sectionType {
        case .photo(let viewModel):
            return 1
        case .information(let viewModels):
            return viewModels.count
        case .episode(let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if indexPath.section == 0{
            cell.backgroundColor = .cyan
        }else if indexPath.section == 1 {
            cell.backgroundColor = .blue
        }else {
            cell.backgroundColor = .purple
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
}
