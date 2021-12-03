//
//  DataProviderProtocol.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import BaseComponents

protocol DataProviderProtocol: AnyObject {
    
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> GenericDataProtocol?
    func selectedItem(at index: Int)
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    
}

extension DataProviderProtocol {
    
    func selectedItem(at index: Int) { }
    func getMoreData() { }
    func isLoadingCell(for index: Int) -> Bool { return false }
    
}
