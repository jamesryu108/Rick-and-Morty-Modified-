//
//  EpisodeCastVC.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

/// Bottom view that will go to the bottom of the EpisodeDetailViewController. This section will show all characters that appeared in the episode, using CV.
class EpisodeCastVC: UIViewController, EpisodeViewFuncs {
    
    // MARK: - Data
    var characters: [CharacterResults] = []
    // MARK: - UICollectionView
    /// CollectionView
    var cv: UICollectionView?
    // MARK: - Objects
    var titleLabel = AttributedTitleLabel(fontSize: 30)
    // MARK: - Network Caller
    /// Network manager that calls for data
    let networkManager = NetworkingManager.shared

    init(characters: [CharacterResults]) {
        super.init(nibName: nil, bundle: nil)
        self.characters = characters
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
        configureConstraints()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        cv = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHelperFunctions.createCVLayout(view: self.view, itemsPerRow: 3, scrollDirection: .horizontal))
        
        cv!.translatesAutoresizingMaskIntoConstraints = false
        
        cv!.delegate = self
        cv!.dataSource = self
        
        cv!.register(EpisodeCastCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCastCollectionViewCell.reuseIdentifier)
        
        self.view.addSubview(cv!)

        cv!.anchor(top: titleLabel.bottomAnchor, verticalSpace: 8, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, left: self.view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 8, right: self.view.safeAreaLayoutGuide.rightAnchor)
    }
    
    func configureUIElements() {
        self.view.addSubview(titleLabel)
        titleLabel.text = "Cast".localize(comment: "")
        titleLabel.textColor = .black
    }
    
    func configureConstraints() {
        titleLabel.anchor(top: self.view.topAnchor, verticalSpace: 8, bottom: nil, left: self.view.leftAnchor, horizontalSpace: 8, right: self.view.rightAnchor, width: nil, height: 32, centerX: nil, centerY: nil)
    }
}

extension EpisodeCastVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCastCollectionViewCell.reuseIdentifier, for: indexPath) as! EpisodeCastCollectionViewCell
                
        networkManager.downloadImage(from: characters[indexPath.row].image, completed: { image in
            DispatchQueue.main.async { [self] in
                cell.characterImage.image = image!
                cell.characterName.text = characters[indexPath.row].name
            }
        })
        
        return cell
    }
}

extension EpisodeCastVC: UICollectionViewDelegateFlowLayout {
}
