//
//  RMFooterLoadingCollectionReusableView.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 9/12/2566 BE.
//

import UIKit

class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    
    static let indentifier =  "RMFooterLoadingCollectionReusableView"
    
    private let spinner:UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews(spinner)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    public func startAnimating(){
        spinner.startAnimating()
    }
}
