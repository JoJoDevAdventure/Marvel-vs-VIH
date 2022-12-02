//
//  NSLayoutConstraints+Util.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    
    public static func pinToView(_ parent: UIView, _ child: UIView, padding: CGFloat = 0) {
        guard child.superview == nil else {
            fatalError("Unable to pin child view. It already has a parent.")
        }
        
        NSLayoutConstraint.activate([
            child.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: padding),
            child.rightAnchor.constraint(equalTo: parent.rightAnchor, constant: -padding),
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: padding),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding)
        ])
    }
    
}
