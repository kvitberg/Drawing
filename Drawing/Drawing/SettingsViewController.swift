//
//  SettingsViewController.swift
//  Drawing
//
//  Created by Scott  on 04/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //Use weak to accualy "destroy" the DrawingViewController 
    weak var drawingVC : DrawingViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Show the navigation bar in Settings
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func erasedTapped(sender: AnyObject) {
        self.drawingVC?.eraseDrawing()
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
