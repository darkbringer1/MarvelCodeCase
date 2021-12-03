//
//  MainViewController.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import UIKit
import BaseComponents

class MainViewController: BaseViewController<MainViewModel> {
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .red
    }
    
}
