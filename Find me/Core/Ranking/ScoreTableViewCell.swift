//
//  ScoreTableViewCell.swift
//  Find me
//
//  Created by Youssef Bhl on 02/12/2022.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var errorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Erorrs "
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time(s)"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score"
        label.font = .systemFont(ofSize: 16, weight: .regular)
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
            errorsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 150),
            
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 240),
            
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public func configure(Score: Score) {
        usernameLabel.text = Score.name
        errorsLabel.text = "\(Score.errors)"
        timeLabel.text = "\(Score.time)"
        scoreLabel.text = "\(Score.score)"
    }

}
