//
//  TitleContainerViewData.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit

class TitleContainerViewData {
    
    private(set) var title: String
    private(set) var titleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)

    init(title: String,
         titleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)) {
        self.title = title
        self.titleFont = titleFont
    }
    
}
