//
//  APITwitterDelegateProtocol.swift
//  Tweeter
//
//  Created by Tyrone Stephen on 2019/10/12.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: AnyObject {
    func process(tweets t: [Tweet])
    func onError(error e: NSError)
}
