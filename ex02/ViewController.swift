//
//  ViewController.swift
//  ex02
//
//  Created by Tyrone STEPHEN on 2019/10/08.
//  Copyright © 2019 Tyrone STEPHEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberDisplayed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: number handlers
    
    @IBAction func numberPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        
        if numberDisplayed.text == "0" {
            numberDisplayed.text = sender.currentTitle
        } else {
            numberDisplayed.text = numberDisplayed.text! + sender.currentTitle!
        }
    }
}

