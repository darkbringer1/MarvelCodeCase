//
//  TitleViewData.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit

class TitleViewData {
    
    private(set) var title: String
    private(set) var titleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
    private(set) var subTitle: String?
    private(set) var subTitleFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    init(title: String,
         titleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold),
         subTitle: String?,
         subTitleFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)) {
        
        self.title = title
        self.titleFont = titleFont
        self.subTitle = subTitle
        self.subTitleFont = subTitleFont
        
    }
    
}
