//
//  ViewController.swift
//  Drawing
//
//  Created by Scott  on 04/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appBecameActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
        
    }
    func appBecameActive() {
        self.buttonsStackView.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //Hide the navigation bar in root ViewController
        self.navigationController?.navigationBarHidden = true
        self.buttonsStackView.hidden = false
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Began touch")
        if let touch = touches.first{
            let point = touch.locationInView(self.imageView)
            self.lastPoint = point
        }
        self.buttonsStackView.hidden = true
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first{
            let point = touch.locationInView(self.imageView)
            print(point)
            
            
            UIGraphicsBeginImageContext(self.imageView.frame.size)
            let context = UIGraphicsGetCurrentContext()
            
            self.imageView.image?.drawInRect(CGRect(x:0, y:0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
            
            CGContextMoveToPoint(context, self.lastPoint.x , self.lastPoint.y)
            CGContextAddLineToPoint(context, point.x, point.y)
            
            CGContextStrokePath(context)
            
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            self.lastPoint = point
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Ended touch")
        self.buttonsStackView.hidden = false
    }
    
    
}

