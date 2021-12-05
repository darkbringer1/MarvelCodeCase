//
//  CharacterDetailViewData.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation

class CharacterDetailViewData {
    
    private(set) var headerViewData: CharacterDetailHeaderViewData?
    private(set) var titleViewData: TitleViewData = TitleViewData(title: "", subTitle: "")
    
    func setCharacterDetailHeaderViewData(by value: CharacterDetailHeaderViewData) -> Self {
        headerViewData = value
        return self
    }
    
    func setTitleViewData(by value: TitleViewData) -> Self {
        titleViewData = value
        return self
    }
    
}
