//
//  EpisodeInfoVC.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

/// Middle view that will go to the EpisodeDetailViewController. This section will show information like name of episode, airdate, and episode number. (e.g. Season 1 Episode 1)
class EpisodeInfoVC: UIViewController {
    
    var episode: Results!
    let stackManager = StackManager()
    
    let titleLabel = AttributedTitleLabel(fontSize: 30)
    let nameLabel = AttributedTitleLabel(fontSize: 20)
    let airDateLabel = AttributedTitleLabel(fontSize: 20)
    let episodeNumberLabel = AttributedTitleLabel(fontSize: 20)
    
    init(episode: Results) {
        super.init(nibName: nil, bundle: nil)
        self.episode = episode
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var vStack: UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheViewController()
        configureUIElements()
        configureConstraints()
    }
    
    func setupTheViewController() {
    }
    
    func configureUIElements() {
        
        self.view.addSubview(titleLabel)
        
        titleLabel.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, verticalSpace: 8, bottom: nil, left: self.view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 8, right: self.view.safeAreaLayoutGuide.rightAnchor, width: nil, height: 32, centerX: nil, centerY: nil)

        titleLabel.text = "Info".localize(comment: "Info title")
        titleLabel.textColor = .black
        
        nameLabel.attributedText = AttributeStringManager.outputAttributedString(text: "Name: ".localize(comment: ""), episodeName: episode.name)
        airDateLabel.attributedText = AttributeStringManager.outputAttributedString(text: "Air Date: ".localize(comment: ""), episodeName: episode.airDate)
        episodeNumberLabel.attributedText = AttributeStringManager.outputAttributedString(text: "Episode: ".localize(comment: ""), episodeName: episode.episode)

        vStack = stackManager.stackMaker(views: [nameLabel, airDateLabel, episodeNumberLabel], settings: StackSettings(alignment: .leading, axis: .vertical, distribution: .fillEqually))
        
        self.view.addSubview(vStack!)

        vStack?.translatesAutoresizingMaskIntoConstraints = false
        
        vStack?.anchor(top: titleLabel.bottomAnchor, verticalSpace: 8, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, left: self.view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: self.view.safeAreaLayoutGuide.rightAnchor)
    }
    
    func configureConstraints() {
    }
}
