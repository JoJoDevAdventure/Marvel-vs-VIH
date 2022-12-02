//
//  LevelCollectionViewCell.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    private lazy var gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = .systemFont(ofSize: 34, weight: .semibold)
        label.textColor = .white
        label.isHidden = true
        return label
    }()
    
    private lazy var lockedIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "lock.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        img.tintColor = .white
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(gradientView)
        gradientView.addSubview(levelLabel)
        gradientView.addSubview(lockedIcon)
    }
    
    private func setupConstraints() {
        let constraints = [
            gradientView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            gradientView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            gradientView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            levelLabel.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            levelLabel.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor),
            
            lockedIcon.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            lockedIcon.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func setupGradient() {
        let colorLeft =  UIColor.black.cgColor
        let colorRight = UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorLeft, colorRight]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.shouldRasterize = true
        
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    public func configure(with level: Level) {
        if level.finished {
            lockedIcon.isHidden = true
            levelLabel.isHidden = false
        }
        
        levelLabel.text = "\(level.number)"
    }
    
    public func isLocked() {
        isLockedAnimation(view: gradientView)
    }
    
}

extension LevelCollectionViewCell {
    private func isLockedAnimation(view: UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            view.transform = CGAffineTransform(translationX: 0, y: -2)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                view.transform = CGAffineTransform(translationX: 0, y: 4)
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                    view.transform = CGAffineTransform(translationX: 0, y: -4)
                } completion: { _ in
                    UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                        view.transform = CGAffineTransform(translationX: 0, y: 4)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                            view.transform = CGAffineTransform(translationX: 0, y: 2)
                        } completion: { _ in
                            
                        }
                    }
                }
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            view.layer.borderColor = UIColor.lightGray.cgColor
            self.lockedIcon.tintColor = UIColor.lightGray
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                view.layer.borderColor = UIColor(red: 148 / 255.0, green: 255 / 255.0, blue: 242 / 255.0, alpha: 1.0).cgColor
                self.lockedIcon.tintColor = UIColor(red: 148 / 255.0, green: 255 / 255.0, blue: 242 / 255.0, alpha: 1.0)
            }
        }
    }
}

