//
//  Tweet.swift
//  Tweeter
//
//  Created by Tyrone Stephen on 2019/10/12.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    let name: String
    let text: String
    
    var description: String {
        return "Name: \(name), Contents: \(text)"
    }
}
