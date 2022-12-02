//
//  TextfieldAnimation.swift
//  Find me
//
//  Created by Youssef Bhl on 02/12/2022.
//

import Foundation
import UIKit

struct TextFieldErrorAnimation {
    
    func textfieldAnimation(textfield : UITextField) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            textfield.transform = CGAffineTransform(translationX: 0, y: -2)
        } completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                textfield.transform = CGAffineTransform(translationX: 0, y: 4)
            } completion: { _ in
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                    textfield.transform = CGAffineTransform(translationX: 0, y: -4)
                } completion: { _ in
                    UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                        textfield.transform = CGAffineTransform(translationX: 0, y: 4)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                            textfield.transform = CGAffineTransform(translationX: 0, y: 2)
                        } completion: { _ in
                            
                        }
                    }
                }
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            textfield.layer.borderColor = UIColor.red.cgColor
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                textfield.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
    
}
