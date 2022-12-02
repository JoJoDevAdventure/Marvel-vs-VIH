//
//  GameViewController.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import UIKit

class GameViewController: UIViewController {
    
    private var time  = -3
    var timer : Timer?
    var errors: Int = 0
    var totalErrors: Int = 0
    
    private var levels: [Level]
    private var currentLevel: Level
    private var currentHeroPosition = 0
    
    private lazy var findHeroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        label.text = "Trouvez :"
        return label
    }()
    
    private lazy var heroImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "lvl1.hero")
        img.heightAnchor.constraint(equalToConstant: 75).isActive = true
        img.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return img
    }()
    
    private lazy var findLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.text = "Trouvez "
        label.textColor = .white
        return label
    }()
    
    private lazy var toFindHeroImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "lvl1.hero")
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return img
    }()
    
    private lazy var timerIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "timer", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
        img.tintColor = UIColor(red: 148 / 255.0, green: 255 / 255.0, blue: 242 / 255.0, alpha: 1.0)
        return img
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.text = "\(time)"
        label.textColor = .white
        return label
    }()
    
    private lazy var errorsIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
        img.tintColor = .red
        return img
    }()
    
    private lazy var errorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.text = "0"
        return label
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        img.image = UIImage(named: "lvl1.background")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private lazy var hiddenHeroImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 15).isActive = true
        img.widthAnchor.constraint(equalToConstant: 15).isActive = true
        img.image = UIImage(named: "lvl1.hero")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private lazy var errorTouch = ErrorTouchView()
    
    private lazy var correctTouch = CorrectTouchView()
    
    private lazy var progressionBar = ProgressionJaugeView()
    
    private lazy var hintsView = HintView()
    
    init(levels: [Level]) {
        self.levels = levels
        self.currentLevel = levels.first!
        super.init(nibName: nil, bundle: nil)
        setupLevel(level: levels.first!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupSubviews()
        setupConstraints()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideLevel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startGame()
        animationIn()
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
        view.addSubview(findLabel)
        view.addSubview(toFindHeroImage)
        view.addSubview(timerIcon)
        view.addSubview(timeLabel)
        view.addSubview(errorsIcon)
        view.addSubview(errorsLabel)
        view.addSubview(backgroundImage)
        view.addSubview(progressionBar)
        view.addSubview(hintsView)
        view.addSubview(findHeroLabel)
        view.addSubview(heroImage)
    }
    
    private func animationIn() {
        hideLevel()
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.findHeroLabel.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height / 1.8)
            self.heroImage.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height / 1.8)
        } completion: { _ in
            self.animationOut()
        }
    }
    
    private func animationOut() {
        UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseOut) {
            self.findHeroLabel.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height / 1.8)
            self.heroImage.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height / 1.8)
        } completion: { _ in
            self.showLevel()
        }
    }
    
    private func showLevel() {
        findLabel.isHidden = false
        toFindHeroImage.isHidden = false
        timerIcon.isHidden = false
        timeLabel.isHidden = false
        errorsIcon.isHidden = false
        errorsLabel.isHidden = false
        backgroundImage.isHidden = false
        hiddenHeroImage.isHidden = false
        progressionBar.isHidden = false
        hintsView.isHidden = false
        
        findHeroLabel.isHidden = true
        heroImage.isHidden = true
    }
    
    private func hideLevel() {
        findLabel.isHidden = true
        toFindHeroImage.isHidden = true
        timerIcon.isHidden = true
        timeLabel.isHidden = true
        errorsIcon.isHidden = true
        errorsLabel.isHidden = true
        backgroundImage.isHidden = true
        hiddenHeroImage.isHidden = true
        progressionBar.isHidden = true
        hintsView.isHidden = true
        
        findHeroLabel.isHidden = false
        heroImage.isHidden = false
    }
    
    private func setupConstraints() {
        let constraints = [
            
            findHeroLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            findHeroLabel.topAnchor.constraint(equalTo: view.bottomAnchor),
            
            heroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heroImage.topAnchor.constraint(equalTo: findHeroLabel.bottomAnchor, constant: 10),
            
            findLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            findLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            toFindHeroImage.leftAnchor.constraint(equalTo: findLabel.rightAnchor, constant: 5),
            toFindHeroImage.centerYAnchor.constraint(equalTo: findLabel.centerYAnchor),
            
            timerIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            timerIcon.centerYAnchor.constraint(equalTo: findLabel.centerYAnchor),
            
            timeLabel.centerYAnchor.constraint(equalTo: timerIcon.centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: timerIcon.rightAnchor, constant: 5),
            
            errorsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            errorsLabel.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            errorsIcon.rightAnchor.constraint(equalTo: errorsLabel.leftAnchor, constant: -5),
            errorsIcon.centerYAnchor.constraint(equalTo: errorsLabel.centerYAnchor),
            
            progressionBar.topAnchor.constraint(equalTo: errorsIcon.bottomAnchor, constant: 20),
            progressionBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            progressionBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            progressionBar.heightAnchor.constraint(equalToConstant: 40),
            
            hintsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hintsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            hintsView.heightAnchor.constraint(equalToConstant: 75),
            hintsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            backgroundImage.topAnchor.constraint(equalTo: progressionBar.bottomAnchor, constant: 20),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: hintsView.topAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.time += 1
            self.timeLabel.text = "\(self.time)"
        })
    }
    
    private func setupLevel(level: Level) {
        backgroundImage.image = UIImage(named: level.imagePath)
        backgroundImage.clipsToBounds = true
        hiddenHeroImage.image = UIImage(named: level.hiddenHero)
        hiddenHeroImage.clipsToBounds = true
        heroImage.image = UIImage(named: level.hiddenHero)
        progressionBar.setupJaugeLevel(level: level.number, totalLevels: levels.count)
        currentHeroPosition = 0
        totalErrors += errors
        errors = 0
        hideHero()
    }
    
    private func hideHero() {
        hiddenHeroImage.removeFromSuperview()
        view.addSubview(hiddenHeroImage)
        let hiddenConstraints = [
            hiddenHeroImage.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: currentLevel.heroLocations[currentHeroPosition].x),
            hiddenHeroImage.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: currentLevel.heroLocations[currentHeroPosition].y)
        ]
        NSLayoutConstraint.activate(hiddenConstraints)
    }
    
    private func setupGesture() {
        backgroundImage.isUserInteractionEnabled = true
        hiddenHeroImage.isUserInteractionEnabled = true
        
        hiddenHeroImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (didGuess(_:))))
        backgroundImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (didTapWrongSpot(_:))))
    }
    
    @objc func didTapWrongSpot(_ touch:UITouch) {
        
        let touchLoc = touch.location(in: view)
        errorTouch.showOn(view: view, position: touchLoc)
        errors += 1
        errorsLabel.text = "\(errors)"
        changeHeroPosition()
        showHint()
    }
    
    private func changeHeroPosition() {
        if errors == 3 {
            currentHeroPosition = 1
            hideHero()
        } else if errors == 6 {
            currentHeroPosition = 2
            hideHero()
        } else if errors == 9 {
            currentHeroPosition = 0
            hideHero()
        }
    }
    
    private func showHint() {
        if errors < 9 {
            if currentHeroPosition == 0 {
                hintsView.showHint(hint: currentLevel.hints[0][errors])
            } else if currentHeroPosition == 1 {
                hintsView.showHint(hint: currentLevel.hints[1][errors-3])
            } else if currentHeroPosition == 2 {
                hintsView.showHint(hint: currentLevel.hints[2][errors-6])
            }
        }
    }
    
    @objc func didGuess(_ touch:UITouch) {
        
        let touchLoc = touch.location(in: view)
        correctTouch.showOn(view: view, position: touchLoc)
        guessedAnimation {
            if self.currentLevel.number == self.levels.count {
                self.navigationController?.pushViewController(RankingViewController(time: self.time, errors: self.totalErrors, numberOfLevels: self.levels.count), animated: true)
            } else {
                print("next level")
                self.nextLevel()
                self.animationIn()
                self.setupLevel(level: self.currentLevel)
            }
        }
    }
    
    private func nextLevel() {
        currentLevel = levels[currentLevel.number]
    }
    
    private func gameWon() {
        
    }
    
    private func guessedAnimation( completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
            self.hiddenHeroImage.transform = CGAffineTransform(scaleX: 4, y: 4)
        } completion: { _ in
            self.hiddenHeroImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.hiddenHeroImage.removeFromSuperview()
            completion()
        }
    }
    
}
