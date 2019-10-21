//
//  ViewController.swift
//  Weather
//
//  Created by Tyrone STEPHEN on 2019/10/21.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit
import sapcai

class ViewController: UIViewController {

    //MARK: properties
    var bot: SapcaiClient?
    @IBOutlet weak var queryTextField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bot = SapcaiClient(token: "32f66e921b570895624a57f27eacac0c", language: "en")
        bot?.analyseText("Weather at WeThinkCode_", successHandler: { Response in
            print("received response")
            let entities: Entities? = Response.entities
            if (entities != nil) {
                let location = entities!.locations?.first
                if (location != nil) {
                    print(location?.lat, location?.lng)
                }
            }
        }, failureHandle: { Error in
            print("Error ", Error)
        })
    }

    //MARK: actions
    @IBAction func makeRequest(_ sender: UIButton) {
        bot?.analyseText(queryTextField.text ?? "", successHandler: { response in
            print(response)
        }, failureHandle: { error in
            print("Error ", error)
        })
    }
}

