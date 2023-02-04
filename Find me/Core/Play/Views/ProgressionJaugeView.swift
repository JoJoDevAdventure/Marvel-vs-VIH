//
//  ProgressionJaugeView.swift
//  Find me
//
//  Created by Youssef Bhl on 01/12/2022.
//

import UIKit

class ProgressionJaugeView: UIView {
    
    private lazy var progressionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews() {
        addSubview(progressionView)
    }
    
    private func setupConstraints() {
        let constraints = [
            progressionView.leftAnchor.constraint(equalTo: leftAnchor),
            progressionView.topAnchor.constraint(equalTo: topAnchor),
            progressionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public func setupJaugeLevel(level: Int, totalLevels: Int) {
        print(level)
        print(totalLevels)
        if level == totalLevels {
            progressionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        } else {
            progressionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(Float(level) / Float(totalLevels)) ).isActive = true
        }
    }

}
