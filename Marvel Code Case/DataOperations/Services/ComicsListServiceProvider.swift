//
//  ComicsListServiceProvider.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ComicsListServiceProvider: ApiServiceProvider<ComicsDataRequest> {
    init(request: ComicsDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.main.value,
                   path: Path.comicList(request.characterId ?? 0).value,
                   data: request)
    }
}
