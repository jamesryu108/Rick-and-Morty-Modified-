//
//  ViewController.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-07.
//

import UIKit

private enum Section {
    case main
}

class ViewController: UIViewController, SetupTheViewController {
    
    // MARK: - Data
    /// Array of Results type that stores all the episode information.
    var resultArray: [Results] = []
    /// Store indexPath.row value, once you click on a cell, so that it knows which value to send when seguing to EpisodeDetailViewController
    var selectedIndex: Int?
    /// Keep track of total episodes that have been feteched
    var episodeCount: Int = 0
    /// Maximum episode available from the API
    var maxEpisodeCount: Int = 51
    /// Total page counts
    var pageCount: Int = 0
    
    // MARK: - UICollectionView
    /// CollectionView
    var cv: UICollectionView?
    /// Data source of UICollectionView that was created using UICollectionViewDiffableDataSource
    private var dataSource: UICollectionViewDiffableDataSource<Section, Results>!
    
    // MARK: - Network Caller
    /// Network manager that calls for data
    let networkManager = NetworkingManager.shared
    
    // MARK: - View
    /// Suitable for adding tasks that only needs to be done once after view is loaded. (e.g. Network calls, setting up UI objects and etc)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheViewController()
        setupCollectionView()
        setupDataSource()
        fetchEpisodes()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EpisodeInfoContainer, let selectedIndex = selectedIndex {
            vc.resultsData = resultArray[selectedIndex]
        }
    }
    // MARK: - Network func
    /// Network function to fetch episodes from the server
    func fetchEpisodes() {
        guard maxEpisodeCount > episodeCount else {
            self.present(self.alertControllerPresenter(title: "Error", message: "Loaded all already"), animated: true, completion: nil)
            return
        }
        // Add 1 to the pageCount
        pageCount += 1
        //activityIndicator.startAnimating()
        networkManager.getAllEpisodes(pageCount: pageCount) { [self] result in
            switch result {
            case .success(let episode):
                for res in episode!.results {
                    resultArray.append(res)
                }
                maxEpisodeCount = episode!.info.count
                
                DispatchQueue.main.async { [self] in
                   updateData()
                }
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self.present(self.alertControllerPresenter(title: "Error", message: error.rawValue), animated: true) {
                    }
                }
            }
        }
    }
    
    // MARK: - View set up
    /// Set up your View Controller here. Do stuff like hiding nav bar, or set background colours
    func setupTheViewController() {
        
        if let _ = navigationController {
            
            title = "Rick & Morty App".localize(comment: "")
            addRightBarItem()
        }
    }
    
    /// Adding the right bar item
    func addRightBarItem() {
        
        let rightBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise.circle.fill"), style: .done, target: self, action: #selector(refreshTheCV))
               
         navigationItem.rightBarButtonItems = [rightBarItem]
    }
    
    /// Reload the data and show the changes on UICollectionView
    @objc func refreshTheCV() {
        updateData()
    }
    
    // MARK: - CV-related work
    
    /// Setting up UICollectionView. Set delegate and datasource.
    func setupCollectionView() {
        
        cv = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHelperFunctions.createCVLayout(view: self.view, itemsPerRow: 2, scrollDirection: .vertical))
        
        cv!.translatesAutoresizingMaskIntoConstraints = false
        cv!.backgroundColor = .systemBackground
        cv!.delegate = self
        
        cv!.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.reuseIdentifier)
        
        self.view.addSubview(cv!)

        cv!.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, verticalSpace: 0, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, left: self.view.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: self.view.safeAreaLayoutGuide.rightAnchor)
    }
}

// MARK: - UICollectionViewDelegate/UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate {
    
    /// Setting up the data source for the UICollectionView
    func setupDataSource() {
        
        guard let cv = cv else { return }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: cv, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.reuseIdentifier, for: indexPath) as? EpisodeCollectionViewCell else {
                return nil
            }
            
            cell.setupTheCell()
            cell.addData(data: item)
            return cell
        })
    }
    
    /// Update the data source for your cv
    func updateData() {
    
        var snapshot = NSDiffableDataSourceSnapshot<Section, Results>()
            snapshot.appendSections([.main])
            snapshot.appendItems(resultArray, toSection: .main)
        
        DispatchQueue.main.async { [self] in
            dataSource.apply(snapshot, animatingDifferences: true) {
            }
            
            guard let cv = cv else {
                reeturn
            }
            
            cv.reloadData()
        }
    }
    /// Once scroll down to the end, load more. Check
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Fetch if you are almost scrolled to the bottom of the list AND maximum episode have not yet been fetched...
        if ((resultArray.count - 4) == indexPath.row) && (resultArray.count != maxEpisodeCount) {
            fetchEpisodes()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: EpisodeInfoContainer.segueIdentifier, sender: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
}
