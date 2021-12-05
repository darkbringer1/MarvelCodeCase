//
//  MainViewDataFormatter.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 4.12.2021.
//

import Foundation
import BaseComponents

class MainViewDataFormatter: MainViewDataFormatterProtocol {
    
    private var componentData: CharactersListData?
    private var list: [Character] = [Character]()
    
    var paginationData: PaginationInfo = PaginationInfo()
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= paginationData.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: CharacterDataResponse) {
        self.componentData = response.data
        self.paginationData.resultCount = response.data.count
        self.list.append(contentsOf: response.data.results)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return ContentDisplayerViewData(imageData: CustomImageViewComponentData(imageUrl: createImageData(by: list[index].thumbnail)), name: list[index].name)
    }
    func getItemId(at index: Int) -> Int {
        return list[index].id
    }
    private func createImageData(by value: Thumbnail) -> String {
        return "\(value.path)/portrait_incredible.\(value.thumbnailExtension)"
    }
    
}
