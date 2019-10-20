//
//  ViewController.swift
//  Shapes
//
//  Created by Tyrone STEPHEN on 2019/10/20.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedView(_ sender: UITapGestureRecognizer) {
        let location: CGPoint = sender.location(in: view)
        view.addSubview(Shape(frame: CGRect(x: location.x - 50, y: location.y - 50, width: 100, height: 100)))
        print("Tapped view at \(sender.location(in: view))")
    }
    
}

class Shape: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let randomNumber = Int.random(in: 0..<2)
        
        if (randomNumber == 1) {
            layer.cornerRadius = frame.width / 2
        }
        backgroundColor = UIColor.random()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This view is intended to be created programatically")
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
