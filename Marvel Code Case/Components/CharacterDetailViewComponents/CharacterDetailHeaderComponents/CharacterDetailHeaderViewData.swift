//
//  CharacterDetailHeaderViewData.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation

class CharacterDetailHeaderViewData {
    
    private(set) var imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "")
    
    init(imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "")) {
        self.imageContainerData = imageContainerData
    }
    
}
 
