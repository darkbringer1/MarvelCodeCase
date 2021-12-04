//
//  SplashViewBuilder.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 4.12.2021.
//

import UIKit

class SplashViewBuilder {
    
    class func build(with completion: @escaping VoidBlock) -> UIViewController {
        let viewModel = SplashViewModel(completion: completion)
        return SplashViewController(viewModel: viewModel)
    }
    
}
