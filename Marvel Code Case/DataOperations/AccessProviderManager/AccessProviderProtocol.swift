//
//  AccessProviderProtocol.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation

protocol AccessProviderProtocol {
    
    func returnUniqueData() -> String
    func returnApiKey() -> String
    func returnHash() -> String

}
