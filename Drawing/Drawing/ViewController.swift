//
//  ViewController.swift
//  Drawing
//
//  Created by Scott  on 04/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //Hide the navigation bar in root ViewController
        self.navigationController?.navigationBarHidden = true
    }


}
