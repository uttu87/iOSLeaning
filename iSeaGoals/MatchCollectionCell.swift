//
//  MatchCollectionCell.swift
//  iSeaGoals
//
//  Created by Pham Van Hai on 4/4/19.
//  Copyright © 2019 Pham Van Hai. All rights reserved.
//

import UIKit

class MatchCollectionCell: UICollectionViewCell {
    var matchView: UIStackView = UIStackView()
    var thumbnail: UIImageView = UIImageView()
    var name: UILabel = UILabel()
    var desc:UILabel = UILabel()
    
    func autoLayoutCell() {
        self.backgroundColor = .white
        self.addSubview(matchView)
        
        matchView.translatesAutoresizingMaskIntoConstraints = false
        
        matchView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        matchView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        matchView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        matchView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //Add Thumbnail
        matchView.addArrangedSubview(thumbnail)
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.heightAnchor.constraint(equalTo: matchView.heightAnchor, multiplier: 2.0/3.0).isActive = true
        thumbnail.image = UIImage(named: "match")
        
        //Add name
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Match name"
        name.font = UIFont.boldSystemFont(ofSize: 15)
        matchView.addArrangedSubview(name)
        
        //Add description
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.text = "Match description"
        desc.font = UIFont.systemFont(ofSize: 15)
        matchView.addArrangedSubview(desc)
        
        //StackView settings
        matchView.axis = .vertical
        matchView.alignment = .leading
        matchView.distribution = .equalSpacing
        matchView.spacing = 10
    }
}
