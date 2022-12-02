//
//  CorrectTouchView.swift
//  Find me
//
//  Created by Youssef Bhl on 01/12/2022.
//

import UIKit

class CorrectTouchView: UIView {
    
    private lazy var correctIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
        img.tintColor = .systemGreen
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
        addSubview(correctIcon)
        
        let constraints = [
            correctIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            correctIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
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
            self.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        } completion: { _ in
            self.hideIconAnimation()
        }
        
    }
    
    private func hideIconAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
                self.alpha = 0
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
    
    
    

}
