//
//  ViewController.swift
//  42_events
//
//  Created by Tyrone Stephen on 2019/10/16.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let clientId = "253c24da3a92d302d3aa9388a7fd8e5218d7e395a84ae8f95a06d04db5918843"
    let secret = "1f0a0d4fcb43f0e56619fae1f79f47a97054ac0841f6a26d6d354674087d13ff"
    let baseURL = "https://api.intra.42.fr/oauth/authorize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func getAuthToken(_ sender: UIButton) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.intra.42.fr"
        urlComponents.path = "/oauth/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: "events://oauth/callback"),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: "public")
        ]
        print(urlComponents.url?.absoluteString)
        let task = URLSession.shared.dataTask(with: urlComponents.url! as URL) { (data, response, error) in
            if error == nil {
                guard let url = URL(string: response!.url!.absoluteString) else { return }
                UIApplication.shared.openURL(url)
            } else {
                print("Error making call to get token")
            }
        }
        task.resume()
    }
}

