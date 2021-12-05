//
//  MainViewBuilder.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        
        let dataFormatter = MainViewDataFormatter()
        let accessProviderManager = AccessProviderManager.shared
        let viewModel = MainViewModel(dataFormatter: dataFormatter, accessProviderManager: accessProviderManager)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "MARVEL", attributes:[
                                                    .foregroundColor: UIColor.white,
                                                    .font: UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold),
                                                    .kern: -4])
        navTitle.append(NSMutableAttributedString(string: " Characters", attributes:[
                                                    .font: UIFont.boldSystemFont(ofSize: 16.0),
                                                    .foregroundColor: UIColor.white,
                                                    .kern: -0.75]))
        navLabel.attributedText = navTitle
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        viewController.navigationItem.titleView = navLabel
        navigationController.setTintColor(.white)

        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = MarvelColorHelper.marvelRed.value
        viewController.navigationController?.navigationBar.standardAppearance = appearance
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
        
        return navigationController
        
    }
    
}
