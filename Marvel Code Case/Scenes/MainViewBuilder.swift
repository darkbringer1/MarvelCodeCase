//
//  MainViewBuilder.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.title = "Characters"
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        viewController.navigationController?.navigationBar.standardAppearance = appearance
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
        
        return navigationController
        
    }
    
}
