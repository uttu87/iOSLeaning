//
//  Match.swift
//  iSeaGoals
//
//  Created by Pham Van Hai on 4/4/19.
//  Copyright © 2019 Pham Van Hai. All rights reserved.
//

import Foundation

struct Match : Codable {
    var thumbnail: String?
    var name: String?
    var desc: String?
}

extension Match: Equatable {
    static func ==(lhs: Match, rhs: Match) -> Bool {
        return (lhs.name == rhs.name) && (lhs.thumbnail == rhs.thumbnail) && (lhs.desc == rhs.desc)
    }
}
