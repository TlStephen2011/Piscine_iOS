//
//  ViewController.swift
//  Shapes
//
//  Created by Tyrone STEPHEN on 2019/10/20.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private var animator: UIDynamicAnimator!
    private var subviews: [Shape] = []
    private var gravity: UIGravityBehavior!
    private var bounce: UIDynamicItemBehavior!
    private var boundries: UICollisionBehavior!
    private var selectedShape: Shape? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        
        // Behaviors
        gravity = UIGravityBehavior()
        let direction = CGVector(dx: 0.0, dy: 1.0)
        gravity.gravityDirection = direction
        boundries = UICollisionBehavior()
        boundries.translatesReferenceBoundsIntoBoundary = true
        bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.5
        
        animator.addBehavior(gravity)
        animator.addBehavior(boundries)
        animator.addBehavior(bounce)
        
        //Gesture recognizers on superview
        addPanGesture(view: view)
    }

    @IBAction func tappedView(_ sender: UITapGestureRecognizer) {
        let location: CGPoint = sender.location(in: view)
        let shape = Shape(frame: CGRect(x: location.x - 50, y: location.y - 50, width: 100, height: 100))
        subviews.append(shape)
        view.addSubview(shape)
        
        // Gesture recognizers
        //addPanGesture(view: shape)
        
        // Add subview to certain behaviors
        gravity.addItem(shape)
        bounce.addItem(shape)
        boundries.addItem(shape)
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MainViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        
        switch sender.state {
        case .began:
            
            let tapLocation = sender.location(in: view);
            
            for shape in subviews {
                if (shape.layer.presentation()?.frame.contains(tapLocation))! {
                    selectedShape = shape
                }
            }
            
            if (selectedShape != nil) {
                view.bringSubviewToFront(selectedShape!)
                gravity.removeItem(selectedShape!)
            }
            
        case .changed:
            if (selectedShape != nil) {
                selectedShape!.center = CGPoint(x: selectedShape!.center.x + translation.x, y: selectedShape!.center.y)
                sender.setTranslation(CGPoint.zero, in: view)
            }
        case .ended:
            if (selectedShape != nil) {
                gravity.addItem(selectedShape!)
                selectedShape = nil
            }
            
        default:
            print("Default case in pan gesture")
        }
        
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
