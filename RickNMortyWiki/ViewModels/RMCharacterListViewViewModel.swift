//
//  CharacterListViewViewModel.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitailCharacters()
    func didSelectCharacter(_ character:RMCharacter)
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
    
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    private var isLoadMoreCharacters = false
    
    public func fetchCharacters() {
        
        let request = RMRequest(endpoint: .character)
        
        RMService.shared.execute(request: request, expecting: RMGetAllCharactersResponse.self, completion: { [weak self] results in
            switch results {
            case .success(let model):
                self?.characters = model.results
                self?.apiInfo = model.info
                DispatchQueue.main.async{
                    self?.delegate?.didLoadInitailCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
        )
    }
    
    public func fetchMoreCharacter() {
        return
    }
    
    public var shouldShowLoadMoreIndicator:Bool {
        return apiInfo != nil
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
              let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: RMFooterLoadingCollectionReusableView.indentifier,
                for: indexPath) as?  RMFooterLoadingCollectionReusableView   else {
            fatalError("Unsupported SupplementaryView")
        }
        footer.startAnimating()
        return footer
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        //hide the footer if shouldShowLoadMoreIndicator is false
        guard shouldShowLoadMoreIndicator else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds  = UIScreen.main.bounds
        let width =  (bounds.width - 30) / 2
        let height =  width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
    
    
}

extension RMCharacterListViewViewModel: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator, !isLoadMoreCharacters else {
            return
        }
        let offset = scrollView.contentOffset.y
        let totalContentHeight  = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height
        
        if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120){
            print("should fetch more character")
            isLoadMoreCharacters = true
        }
    }
}
