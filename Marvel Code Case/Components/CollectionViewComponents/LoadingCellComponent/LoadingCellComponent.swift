//
//  LoadingCellComponent.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import UIKit
import BaseComponents

class LoadingCellView: BaseCollectionViewCell {
    var activityIndicator: UIActivityIndicatorView!
    
    override func setupView() {
        super.setupView()
        prepareViewCell()
    }
    
    private func prepareViewCell() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .medium
        
        contentView.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        indicator.startAnimating()
        
    }
    
}
