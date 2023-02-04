//
//  ViewController.swift
//  Find me
//
//  Created by Youssef Bhl on 25/11/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var playButton = CustomGradButton(title: "Jouer")
    
    private lazy var levelsButton = CustomGradButton(title: "Niveaux")
    
    private lazy var ranks = CustomGradButton(title: "Classements")
    
    private lazy var logoImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "MarvelLogo")
        return img
    }()
    
    let viewModel : MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        setupButtonActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    private func setGradientBackground() {
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .white
        let colorTop =  UIColor.black.cgColor
        let colorBottom = UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    private func setupSubviews() {
        view.addSubview(playButton)
        view.addSubview(levelsButton)
        view.addSubview(logoImage)
        view.addSubview(ranks)
    }
    
    private func setupConstraints() {
        let constraints = [
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            levelsButton.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            levelsButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 30),
            
            ranks.centerXAnchor.constraint(equalTo: levelsButton.centerXAnchor),
            ranks.topAnchor.constraint(equalTo: levelsButton.bottomAnchor, constant: 30),
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            logoImage.widthAnchor.constraint(equalToConstant: 250),
            logoImage.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupButtonActions() {
        playButton.addAction(UIAction(handler: {[weak self] _ in
            self?.viewModel.didTapPlayButton()
        }), for: .touchUpInside)
        
        levelsButton.addAction(UIAction(handler: {[weak self] _ in
            self?.viewModel.didTapLevelsButton()
        }), for: .touchUpInside)
        
        ranks.addAction(UIAction(handler: {[weak self] _ in
            let vc = RankingViewController(time: 0, errors: 0, numberOfLevels: 0)
            self?.navigationController?.pushViewController(vc, animated: true)
            vc.scorePopUp.hidePopUp()
        }), for: .touchUpInside)
    }
}

extension MainViewController: MainViewModelOutPut {
    
    func goToPlayScreen() {
        let gameVC = GameViewController(levels: Data.shard.Levels)
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func goToLevelsScreen() {
        let levelsVC = LevelsViewController(viewModel: LevelsViewModel(), levels: Data.shard.Levels)
        navigationController?.pushViewController(levelsVC, animated: true)
    }
    
}
