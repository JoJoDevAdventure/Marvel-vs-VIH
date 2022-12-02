//
//  ErrorTouchView.swift
//  Find me
//
//  Created by Youssef Bhl on 29/11/2022.
//

import Foundation
import UIKit

class ErrorTouchView: UIView {
    
    private lazy var errorIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
        img.tintColor = .red
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(errorIcon)
        
        let constraints = [
            errorIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            errorIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public func showOn(view: UIView, position: CGPoint) {
        self.removeFromSuperview()
        alpha = 1
        view.addSubview(self)
        self.frame = CGRect(x: position.x - 15, y: position.y - 15, width: 30, height: 30)
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
            self.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        } completion: { _ in
            self.hideIconAnimation()
        }
        
    }
    
    private func hideIconAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
                self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.alpha = 0
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
    
    
    
}
