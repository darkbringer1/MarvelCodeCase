//
//  CharacterDisplayerViewData.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import BaseComponents

class ContentDisplayerViewData: GenericDataProtocol {
    
    var type: GenericRowType? = nil
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var name: String
    
    init(imageData: CustomImageViewComponentData,
         name: String) {
        self.imageData = imageData
        self.name = name
    }
    
}
