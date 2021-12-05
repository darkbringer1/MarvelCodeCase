//
//  CharacterListServiceProvider.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListServiceProvider: ApiServiceProvider<CharacterDataRequest> {
    
    init(request: CharacterDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.main.value,
                   path: Path.characters.value,
                   data: request)
    }
    
}
