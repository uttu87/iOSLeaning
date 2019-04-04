//
//  UIImageView+Extensions.swift
//  iSeaGoals
//
//  Created by Hai Pham on 4/4/19.
//  Copyright © 2019 Pham Van Hai. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func getImageFromURL(urlString: String) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: {(data, response, error) -> Void in
            if(error != nil) {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
