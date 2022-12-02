//
//  RankingViewController.swift
//  Find me
//
//  Created by Youssef Bhl on 02/12/2022.
//

import UIKit

class RankingViewController: UIViewController {
    
    var time: Int
    var errors: Int
    var numberOfLevels: Int
    
    var ranks = Data.shard.ranks
    
    private lazy var rankingTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.registerCell(FirstTableViewCell.self)
        table.registerCell(ScoreTableViewCell.self)
        table.separatorColor = .lightGray
        return table
    }()
    
    public lazy var scorePopUp = ScorePopUpView()
    
    init(time: Int, errors: Int, numberOfLevels: Int) {
        self.time = time
        self.errors = errors
        self.numberOfLevels = numberOfLevels
        super.init(nibName: nil, bundle: nil)
        let score = Float(Float(numberOfLevels) / (Float(time) + Float(errors)*5)) * 1000
        scorePopUp.showPopUp(on: view, score: score, time: time, errors: errors)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scorePopUp.delegate = self
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        setGradientBackground()
        addSubviews()
        setupConstraints()
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
    
    private func addSubviews() {
        view.addSubview(rankingTableView)
    }
    
    private func setupConstraints() {
        let constraints = [
            rankingTableView.topAnchor.constraint(equalTo: view.topAnchor),
            rankingTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            rankingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rankingTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension RankingViewController: ScorePopUpDelegate {
    
    func didTapSubmit(Score: Score) {
        scorePopUp.hidePopUp()
        ranks.append(Score)
        DispatchQueue.main.async {
            self.rankingTableView.reloadData()
        }
    }
    
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ranks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeResuableCell(for: FirstTableViewCell.self, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeResuableCell(for: ScoreTableViewCell.self, for: indexPath)
            let sortedRanks = ranks.sorted { score1, score2 in
                score1.score > score2.score
            }
            print(indexPath.row)
            print(sortedRanks.count)
            let score = sortedRanks[indexPath.row]
            cell.configure(Score: score)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 75
        } else {
            return 50
        }
    }
    
}
