//
//  APIController.swift
//  42_events
//
//  Created by Tyrone Stephen on 2019/10/16.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import Foundation

class APIController {
    static var token: String?
    
    static func getMe() -> Result<User?, NetworkError> {
        let path = "https://api.intra.42.fr/v2/me"
        
        guard let url = URL(string: path) else { return .failure(.url) }
        let req = URLRequest(url: url)
        
        req.httpMethod = "GET"
        req.addValue("Bearer " + APIController.token!, forHTTPHeaderField: "Authorization")
        
        var result: Result<User?, NetworkError>!
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: req) { (data, _, _) in
            if let data = data {
                let jsonD = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    for (k, v) in jsonD! {
                        print("\(k): \(v)")
                    }
                }
                //parse data and build user and return .success
                result = .success(User("Tyrone", "Stephen", "tstephen", "https://www.google.com", 10.0000000))
            } else {
                result = .failure(.server)
            }
            semaphore.signal()
        }.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return result
    }
    
}
