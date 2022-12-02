//
//  LevelsViewController.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import UIKit

class LevelsViewController: UIViewController {
    
    let levels: [Level]
    let viewModel: LevelsViewModel
    
    private lazy var levelsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout().exploreLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerCell(LevelCollectionViewCell.self)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    init(viewModel: LevelsViewModel, levels: [Level]) {
        self.viewModel = viewModel
        self.levels = levels
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
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
        view.addSubview(levelsCollection)
        levelsCollection.delegate = self
        levelsCollection.dataSource = self
    }
    
    private func setupConstraints() {
        levelsCollection.frame = view.frame
    }
    
}

extension LevelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeResuableCell(for: LevelCollectionViewCell.self, for: indexPath)
        cell.configure(with: levels[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? LevelCollectionViewCell else { return }
        if levels[indexPath.row].finished == false {
            cell.isLocked()
        }
    }
    
}

