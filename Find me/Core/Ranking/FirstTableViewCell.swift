//
//  FirstTableViewCell.swift
//  Find me
//
//  Created by Youssef Bhl on 02/12/2022.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nom    "
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var errorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Erreurs "
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temps (s)"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {

        addSubview(usernameLabel)
        addSubview(errorsLabel)
        addSubview(timeLabel)
        addSubview(scoreLabel)
        
        let constraints = [
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            errorsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            errorsLabel.leftAnchor.constraint(equalTo: usernameLabel.rightAnchor, constant: 40),
            
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: errorsLabel.rightAnchor, constant: 30),
            
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
