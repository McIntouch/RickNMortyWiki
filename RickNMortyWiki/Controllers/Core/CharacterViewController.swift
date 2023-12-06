//
//  CharacterViewController.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 4/12/2566 BE.
//

import UIKit

class CharacterViewController: UIViewController {

    let characterListView = RMCharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        setupView()
        
        
    }
    private func setupView() {
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
                   characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                   characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                   characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                   characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               ])
    }


}
