//
//  EpisodeTopImageVC.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

/// Topmost View that will go to the EpisodeDetailViewController
final class EpisodeTopImageVC: UIViewController, EpisodeViewFuncs, SetupTheViewController {
    
    let topImageView: EpisodeTopImageView = EpisodeTopImageView(frame: .zero)
    let episodeTitleLabel = AttributedTitleLabel(fontSize: 25)
    var episodeName: String!
    
    init(episodeName: String) {
        super.init(nibName: nil, bundle: nil)
        self.episodeName = episodeName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheViewController()
        configureUIElements()
        configureConstraints()
    }
    
    func setupTheViewController() {
    }
    /// Stylize elements here
     private func configureUIElements() {
         self.view.addSubview(topImageView)
         topImageView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, verticalSpace: 0, left: self.view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: self.view.safeAreaLayoutGuide.rightAnchor, height: 200, centerX: self.view.centerXAnchor)
         
         topImageView.addSubview(episodeTitleLabel)
         episodeTitleLabel.anchor(top: topImageView.topAnchor, verticalSpace: 0, bottom: topImageView.bottomAnchor, left: topImageView.leftAnchor, horizontalSpace: 0, right: topImageView.rightAnchor)
         episodeTitleLabel.text = episodeName
     }
     
     /// Set constraints (e.g. AutoLayout) for all ements right here
     func configureConstraints() {
     }
}
