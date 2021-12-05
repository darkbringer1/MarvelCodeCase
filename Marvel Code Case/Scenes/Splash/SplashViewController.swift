//
//  SplashViewController.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 4.12.2021.
//

import Foundation
import UIKit
import BaseComponents

class SplashViewController: BaseViewController<SplashViewModel> {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = false
        image.image = UIImage(imageLiteralResourceName: "iron-man")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var titleInfo: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "CODE CASE"
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = .white
        return title
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addMainComponent()
        viewModel.fireApplicationInitiateProcess()
    }
    
    private func addMainComponent() {
        view.addSubview(image)
        view.addSubview(titleInfo)
        
        NSLayoutConstraint.activate([
        
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
            
            
        ])
        
    }
    
}
