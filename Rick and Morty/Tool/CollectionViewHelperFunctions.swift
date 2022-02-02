//
//  CollectionViewHelperFunctions.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import UIKit

struct CollectionViewHelperFunctions {
    
    /// Set up Flow layout based on certain number of rows
    static func createCVLayout(view: UIView, itemsPerRow: CGFloat, scrollDirection: UICollectionView.ScrollDirection) -> UICollectionViewFlowLayout {
        
        /// Total width in the view (in points)
        let width: CGFloat = view.bounds.width
        /// Space between the cell
        let minimumItemSpacing: CGFloat = 8
        /// Set how many items you want in a row from CV, so that your CV can adjust
        //let itemsPerRow: CGFloat = 2
        /// Padding size between items.
        let paddingSize: CGFloat = 8
        /// Check total width available for cells
        let widthAvailableInPoints: CGFloat = width - (paddingSize * 2) - (minimumItemSpacing * 2)
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset = UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize)
        flowLayout.itemSize = CGSize(width: widthAvailableInPoints / itemsPerRow, height: widthAvailableInPoints / itemsPerRow)
        flowLayout.scrollDirection = scrollDirection
        
        return flowLayout
    }
    
    /// Set up Flow layout based on certain number of rows
    static func createLayout(view: UIView) -> UICollectionViewFlowLayout {
        /// Total width in the view (in points)
        let width: CGFloat = view.bounds.width
        /// Space between the cell
        let minimumItemSpacing: CGFloat = 8
        /// Set how many items you want in a row from CV, so that your CV can adjust
        let itemsPerRow: CGFloat = 3
        /// Padding size between items.
        let paddingSize: CGFloat = 8
        /// Check total width available for cells
        let widthAvailableInPoints: CGFloat = width - (paddingSize * 2) - (minimumItemSpacing * 2)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize)
        flowLayout.itemSize = CGSize(width: widthAvailableInPoints / itemsPerRow, height: widthAvailableInPoints / itemsPerRow)
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
}
