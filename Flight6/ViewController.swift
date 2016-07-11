//
//  ViewController.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {
    
    var workout: Workout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //set background color 
        view.backgroundColor = UIColor(hue: 0.5733, saturation: 0.75, brightness: 0.68, alpha: 1.0) /* #346fae */
        //set color of navbar text
         self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}

