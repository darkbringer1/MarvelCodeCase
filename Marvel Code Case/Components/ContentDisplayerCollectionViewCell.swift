//
//  ContentDisplayerCollectionViewCell.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit
import BaseComponents

class ContentDisplayerCollectionViewCell: GenericCollectionViewCell<GenericDataProtocol, ContentDisplayerView> {
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    func setViewConfigurations() {
        backgroundColor = .white
        contentView.backgroundColor = .white
    }
}
