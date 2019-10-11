//
//  Death.swift
//  DeathNote
//
//  Created by Tyrone STEPHEN on 2019/10/11.
//  Copyright © 2019 Tyrone STEPHEN. All rights reserved.
//

import Foundation

class Death {
    var name: String
    var description: String
    var date: String
    
    init(name n: String, desc d: String, date someDate: String) {
        self.name = n
        self.description = d
        self.date = someDate
    }
}
