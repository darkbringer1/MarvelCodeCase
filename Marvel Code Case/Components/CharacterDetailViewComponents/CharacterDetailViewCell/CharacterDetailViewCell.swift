//
//  CharacterDetailViewCell.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit
import BaseComponents

class CharacterDetailViewCell: GenericCollectionViewCell<TitleViewData, TitleView> {
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        var targetSize = targetSize
        targetSize.height = CGFloat.greatestFiniteMagnitude
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return size
    }
    
}
