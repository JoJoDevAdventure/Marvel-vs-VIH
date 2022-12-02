//
//  HintView.swift
//  Find me
//
//  Created by Youssef Bhl on 01/12/2022.
//

import UIKit

class HintView: UIView {
    
    private lazy var hintsLabel: UILabel = {
        let label = UILabel()
        label.text = "Indices : "
        label.font = UIFont(name: "Rockwell-Regular", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var hint: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rockwell-Regular", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(hintsLabel)
        addSubview(hint)
    }
    
    private func setupConstraints() {
        let contraints = [
            hintsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            hintsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            hint.topAnchor.constraint(equalTo: hintsLabel.bottomAnchor, constant: 10),
            hint.leftAnchor.constraint(equalTo: hintsLabel.leftAnchor),
            ]
        NSLayoutConstraint.activate(contraints)
    }
    
    public func showHint(hint: String) {
        self.hint.setTextWithTypeAnimation(typedText: hint + " _", characterDelay: 1)
    }
    
}
