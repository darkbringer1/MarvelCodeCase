//
//  CharacterDetailHeaderView.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit
import BaseComponents

class CharacterDetailHeaderView: GenericBaseView<CharacterDetailHeaderViewData> {
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let image = CustomImageViewComponentContainer()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 2
        image.clipsToBounds = true
        return image
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
    }
    private func addComponents() {
        addSubview(imageContainer)
        
        NSLayoutConstraint.activate([
            
            imageContainer.topAnchor.constraint(equalTo: topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        imageContainer.setData(by: data.imageContainerData)
    }
    
}
