//
//  MainViewController.swift
//  iSeaGoals
//
//  Created by Pham Van Hai on 4/4/19.
//  Copyright © 2019 Pham Van Hai. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{

    var collectionView: UICollectionView?
    let matchCellId = "MatchCell"
    let cellSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.backgroundColor = .white
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        //collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: matchCellId)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchCellId, for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan : .orange
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = .red
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        //let width = (UIScreen.main.bounds.width - 3 * cellSpacing) / 2
        //let height = width
        //return CGSize(width: width, height: height)
        
        let width = (UIScreen.main.bounds.width - 3 * cellSpacing) / 2
        let height = (UIScreen.main.bounds.height - 4 * cellSpacing) / 3
        return CGSize(width: width, height: height)
    }
}
