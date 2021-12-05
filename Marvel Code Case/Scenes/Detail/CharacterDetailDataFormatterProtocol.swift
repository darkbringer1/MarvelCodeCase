//
//  CharacterDetailDataFormatterProtocol.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation

protocol CharacterDetailDataFormatterProtocol {

    func getCharacterDetailData(from rawData: CharacterDataResponse) -> CharacterDetailViewData
    func getComicsData(from comicsData: ComicsDataResponse) -> CharacterDetailViewData
    
}
