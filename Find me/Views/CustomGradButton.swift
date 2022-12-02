//
//  CustomGradButton.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import UIKit

class CustomGradButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButtonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonUI() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        
        layer.cornerRadius = 35
        
        clipsToBounds = true
        
    }
    
    
}
