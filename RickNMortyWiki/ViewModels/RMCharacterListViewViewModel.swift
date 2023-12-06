//
//  CharacterListViewViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitailCharacters()
}

final class RMCharacterListViewViewModel : NSObject {
    
    public weak var delegate:RMCharacterListViewViewModelDelegate?
    
    private var characters:[RMCharacter] = [] {
        didSet{
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    imageURL: URL(string:character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels:[RMCharacterCollectionViewCellViewModel] = []
    
    public func fetchAllCharacters() {
        
        let request = RMRequest(endpoint: .character)
        
        RMService.shared.execute(request: request, expecting: RMGetAllCharactersResponse.self, completion: { [weak self] results in
            switch results {
            case .success(let model):
                self?.characters = model.results
                DispatchQueue.main.async{
                    self?.delegate?.didLoadInitailCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
        )
    }
    
}

extension RMCharacterListViewViewModel : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds  = UIScreen.main.bounds
        let width =  (bounds.width - 30) / 2
        let height =  width * 1.5
        return CGSize(width: width, height: height)
    }
    
    
}
