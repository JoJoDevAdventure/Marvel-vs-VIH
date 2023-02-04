//
//  ScorePopUp.swift
//  Find me
//
//  Created by Youssef Bhl on 02/12/2022.
//

import Foundation
import UIKit

protocol ScorePopUpDelegate: AnyObject {
    func didTapSubmit(Score: Score)
}

final class ScorePopUpView: UIView {
    
    weak var delegate: ScorePopUpDelegate?
    
    private var score: Float = 0
    private var time: Int = 0
    private var errors: Int = 0
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "your score : "
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .white
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        tf.textAlignment = .center
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowRadius = 3
        tf.layer.shadowOpacity = 1
        tf.layer.shadowOffset = CGSize(width: 2, height: 2)
        tf.layer.cornerRadius = 10
        tf.attributedPlaceholder = NSAttributedString(
            string: "Your username",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
       return tf
    }()
    
    private lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowRadius = 3
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = CGSize(width: 2, height: 2)
        btn.setTitle("Submit", for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(scoreLabel)
        addSubview(nameTextField)
        addSubview(submitButton)
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 5
        addSubviews()
        setupConstraints()
        setupButtonAction()
    }
    
    private func setupConstraints() {
        let constraints = [
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 25),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            submitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            submitButton.rightAnchor.constraint(equalTo: nameTextField.rightAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupButtonAction() {
        submitButton.addAction(UIAction(handler: { _ in
            guard let username = self.nameTextField.text, username != "" else { TextFieldErrorAnimation().textfieldAnimation(textfield: self.nameTextField); return }
            let score = Score(name: username, errors: self.errors, time: self.time, score: self.score)
            self.delegate?.didTapSubmit(Score: score)
        }), for: .touchUpInside)
    }
    
    public func showPopUp(on view: UIView, score: Float, time: Int, errors: Int) {
        let formattedScore = String(format: "%.2f", "\(score)")
        scoreLabel.text = "Your score : " + "503.40"
        self.score = score
        self.time = time
        self.errors = errors
        view.addSubview(self)
        let constraints = [
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            self.heightAnchor.constraint(equalToConstant: 200),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public func hidePopUp() {
        self.removeFromSuperview()
    }

}
