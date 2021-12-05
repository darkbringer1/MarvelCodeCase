//
//  SplashViewModel.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 4.12.2021.
//

import Foundation

typealias VoidBlock = () -> Void

class SplashViewModel {
    
    private var splashFinalizeListener: VoidBlock?
    
    init(completion: @escaping VoidBlock) {
        self.splashFinalizeListener = completion
    }
    
    func fireApplicationInitiateProcess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.splashFinalizeListener?()
        }
    }
 
}
