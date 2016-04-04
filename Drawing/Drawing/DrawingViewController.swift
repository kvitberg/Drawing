//
//  DrawingViewController.swift
//  Drawing
//
//  Created by Scott  on 04/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
  
    var lastPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appBecameActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
        self.randomTapped(UIButton())
        
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
            
            CGContextSetRGBStrokeColor(context, self.red, self.green, self.blue, 1.0)
            CGContextSetLineCap(context, .Round)
            CGContextSetLineWidth(context, 20)
            
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
    func eraseDrawing(){
        self.imageView.image = nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "drawingToSettingsSegue"{
            let settingsVC = segue.destinationViewController as! SettingsViewController
            settingsVC.drawingVC = self
        }
        
    }
    @IBAction func blueTapped(sender: AnyObject) {
        // devide by 256 for RGB colors
        self.red = 56 / 255
        self.green = 109 / 255
        self.blue = 229 / 255
    }
    @IBAction func greenTapped(sender: AnyObject) {
        // devide by 256 for RGB colors
        self.red = 37 / 255
        self.green = 235 / 255
        self.blue = 114 / 255
    }
    @IBAction func redTapped(sender: AnyObject) {
        // devide by 256 for RGB colors
        self.red = 229 / 255
        self.green = 56 / 255
        self.blue = 56 / 255
    }
    @IBAction func yellowTapped(sender: AnyObject) {
        // devide by 256 for RGB colors
        self.red = 249 / 255
        self.green = 215 / 255
        self.blue = 23 / 255
    }
    @IBAction func randomTapped(sender: AnyObject) {
        self.red = CGFloat(arc4random_uniform(256)) / 255
        self.green = CGFloat(arc4random_uniform(256)) / 255
        self.blue = CGFloat(arc4random_uniform(256)) / 255
    }
    
}

