//
//  User.swift
//  42_events
//
//  Created by Tyrone STEPHEN on 2019/10/17.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import Foundation

class User {
    var firstName:String?
    var lastName:String?
    var login: String?
    var photo: String?
    var level: Double?
    
    init(fname: String, lname: String, login: String, photo: String, level: Double) {
        self.firstName = fname
        self.lastName = lname
        self.login = login
        self.photo = photo
        self.level = level
    }
    
}
