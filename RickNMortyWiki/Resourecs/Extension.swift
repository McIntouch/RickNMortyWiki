//
//  Extension.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 5/12/2566 BE.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
