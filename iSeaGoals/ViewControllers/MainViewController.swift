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

    var matches = [Match]() {
        didSet {
            guard matches != oldValue else { return }
            matchesDidUpdate()
        }
    }
    
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
        collectionViewFlowLayout.scrollDirection = .vertical
        //collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10
        
        collectionView?.register(MatchCollectionCell.self, forCellWithReuseIdentifier: matchCellId)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // Load Data
        fetchData()
    }
    
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchCellId, for: indexPath) as! MatchCollectionCell
        //cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan : .orange
        //cell.selectedBackgroundView = UIView()
        //cell.selectedBackgroundView?.backgroundColor = .red
        cell.autoLayoutCell()
        cell.match = matches[indexPath.row]
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 3 * cellSpacing) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
    
    private func matchesDidUpdate() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    private func fetchData() {
        // Turn on network indicator in status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // Get the Matches
        DataManager.getStationDataWithSuccess() { (data) in
            
            // Turn off network indicator in status bar
            defer {
                DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            }
            
            if kDebugLog { print("Matches JSON Found") }
            
            guard let data = data, let jsonDictionary = try? JSONDecoder().decode([String: [Match]].self, from: data), let matchesArray = jsonDictionary["match"] else {
                if kDebugLog { print("JSON Match Loading Error") }
                return
            }
            
            self.matches = matchesArray
        }
    }
}
