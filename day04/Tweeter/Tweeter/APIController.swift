//
//  APIController.swift
//  Tweeter
//
//  Created by Tyrone Stephen on 2019/10/12.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import Foundation

class APIController {

    weak var delegate: APITwitterDelegate?
    let token: String
    
    init(delegate d: APITwitterDelegate, token t: String) {
        self.delegate = d
        self.token = t
    }
    
    func getTweets(query q: String) {
        // Get tweets from query and build array and call process
        
        //PLACEHOLDER
        let temp1 = Tweet(name: "Tyrone", text: "Hello, I am some random tweet")
        let temp2 = Tweet(name: "Stevez", text: "Some meaningful and well thought out tweet")
        delegate?.process(tweets: [temp1, temp2])
    }
    
}
