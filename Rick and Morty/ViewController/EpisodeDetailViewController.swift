//
//  EpisodeDetailViewController.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

class EpisodeDetailViewController: UIViewController, SetupTheViewController {
    
    /// Network manager managing all the data fetching
    let networkManager = NetworkingManager.shared
    /// Array of CharacterResults type that stores all the character information.
    var characterArray: [CharacterResults] = []
    /// Identifier needed to segue to EpisodeDetailViewController
    static let segueIdentifier: String = "episodeDetail"
    /// Receive the Results data
    var resultsData: Results?
    /// I consider this as a container to add another UIViewController block
    let topView = UIView()
    /// This is the container where the EpisodeInfoVC will go in
    let itemViewOne = UIView()
    /// This is the section where EpisodeCastVC will go in
    let itemViewTwo = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters(ids: characterIDs(addresses: resultsData!.characters))
        setupTheViewController()
    }
    /// Setting up VC UI
    func setupTheViewController() {
        
    }
    
    /// Add and stylize UI objects here
    func configureUIElements() {
        view.addSubview(topView)
        view.addSubview(itemViewOne)
        view.addSubview(itemViewTwo)
    }
    
    /// Set up the constraints of UI objects here
    func configureConstraints() {
        
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, verticalSpace: 8, left: view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: view.safeAreaLayoutGuide.rightAnchor, height: 180)
        
        itemViewOne.anchor(top: topView.bottomAnchor, verticalSpace: 8, left: view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: view.safeAreaLayoutGuide.rightAnchor, height: 140)
        
        itemViewTwo.anchor(top: itemViewOne.bottomAnchor, verticalSpace: 8, left: view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: view.safeAreaLayoutGuide.rightAnchor, height: 200)
    }
    
    /// The crucial function that will add the separate VC will go into the UIView object (The container)
    func injectTheVC(VC: UIViewController, container: UIView) {
        addChild(VC)
        container.addSubview(VC.view)
        VC.view.frame = container.bounds
        VC.didMove(toParent: self)
    }
        
    /// Get all character ids by manipulating strings in all urls for characters
    func characterIDs(addresses: [String]) -> [Int] {
    
        var idString: [Int] = []
        addresses.map { address in
            
            do {
                let input = address
                let regex = try NSRegularExpression(pattern: "character/", options: NSRegularExpression.Options.caseInsensitive)
                let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))

                if let match = matches.first {
    
                    let startNumber = match.range.lowerBound + "character/".count
                    let totalLength = input.utf16.count
                    
                    if let charRange = Range(NSRange(location: startNumber, length: totalLength - startNumber), in: input) {
                        let name: Int = Int(input[charRange])!
                        idString.append(name)
                    }
                }
            } catch {
                print("error: Something went wrong while trying to manipulate strings with regex...")
            }
        }
        return idString
    }
    
    /// Fetch characters. After receiving the [CharacterResults], it will render view. If no data was successfully fetched, then Alert View will show instead.
    func fetchCharacters(ids: [Int]) {
        networkManager.getAllCharacters(ids: ids) { [self] result in
            
            switch result {
            case .success(let character):
                characterArray = character!
                DispatchQueue.main.async {
                    configureUIElements()
                    configureConstraints()
                    injectTheVC(VC: EpisodeTopImageVC(episodeName: resultsData!.episode), container: topView)
                    injectTheVC(VC: EpisodeInfoVC(episode: resultsData!), container: itemViewOne)
                    injectTheVC(VC: EpisodeCastVC(characters: characterArray), container: itemViewTwo)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.present(self.AlertControllerPresenter(title: "Error while fetching character data", message: error.rawValue), animated: true) {
                    }
                }
            }
        }
    }
}
