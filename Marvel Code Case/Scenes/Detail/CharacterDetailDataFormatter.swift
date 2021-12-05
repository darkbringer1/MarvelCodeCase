//
//  CharacterDetailDataFormatter.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation

class CharacterDetailDataFormatter: CharacterDetailDataFormatterProtocol {
    
    private var data = CharacterDetailViewData()
    
    func getComicsData(from comicsData: ComicsDataResponse) -> CharacterDetailViewData {
        let comicsView = returnComicsViewData(from: comicsData)
        data = data.setComicsViewData(by: comicsView)
        return data
    }
    
    func getCharacterDetailData(from characterData: CharacterDataResponse) -> CharacterDetailViewData {
        let titleView = returnTitleViewData(from: characterData)
        let imageView = returnImageViewData(from: characterData)
        data = data.setCharacterDetailHeaderViewData(by: imageView).setTitleViewData(by: titleView)
        return data
            
    }
    
    private func returnImageViewData(from response: CharacterDataResponse) -> CharacterDetailHeaderViewData {
        let data = response.data.results[0]
        return CharacterDetailHeaderViewData(imageContainerData: CustomImageViewComponentData(imageUrl: data.thumbnail.imageContentCreator()))
    }
    
    private func returnTitleViewData(from response: CharacterDataResponse) -> [TitleViewData] {
        let data = response.data.results[0]
        return [TitleViewData(title: data.name, subTitle: data.resultDescription)]
    }
    
    private func returnComicsViewData(from response: ComicsDataResponse) -> ComicsViewData {
        let comics = ComicsViewData(
            comicsData: response.data.results.map({ ContentDisplayerViewData(
                imageData: CustomImageViewComponentData(
                    imageUrl: $0.thumbnail.imageContentCreator()),
                name: $0.title)
            }))
        data = data.setComicsViewData(by: comics.setTitle(by: (comics.comicsData.count > 0) ? TitleContainerViewData(title: "Comics") : nil))
//        comics.setTitle(by: (comics.comicsData.count > 0) ? TitleContainerViewData(title: "Comics") : nil)
        return comics
    }
}
