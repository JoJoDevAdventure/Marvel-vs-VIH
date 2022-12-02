//
//  MainViewModel.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import Foundation
protocol MainViewModelOutPut: AnyObject {
    func goToPlayScreen()
    func goToLevelsScreen()
}

final class MainViewModel {
    
    weak var output: MainViewModelOutPut?
    
    public func didTapPlayButton() {
        output?.goToPlayScreen()
    }
    
    public func didTapLevelsButton() {
        output?.goToLevelsScreen()
    }
}
