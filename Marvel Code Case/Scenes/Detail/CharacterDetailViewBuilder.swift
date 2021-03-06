//
//  CharacterDetailViewBuilder.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit

class CharacterDetailViewBuilder {
    
    class func build(with data: CharacterDetailViewRequest) -> UIViewController {
        let formatter = CharacterDetailDataFormatter()
        let accessProviderManager = AccessProviderManager.shared
        let viewModel = CharacterDetailViewModel(formatter: formatter, data: data, accessProviderManager: accessProviderManager)
        let viewController = CharacterDetailViewController(viewModel: viewModel)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        viewController.navigationController?.navigationBar.standardAppearance = appearance
        return viewController
    }
}
