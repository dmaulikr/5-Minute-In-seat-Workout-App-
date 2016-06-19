//
//  DetailViewController.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var workout: Workout!
    
    @IBOutlet weak var detailText: UILabel!
    
    @IBOutlet weak var backHome: UIButton!
    let borderAlpha : CGFloat = 0.7
    let cornerRadius : CGFloat = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        self.view.backgroundColor = workout.color
        self.detailText.text = workout.workoutText
        self.title = workout.title
        
//        self.navigationController!.navigationBar.translucent = true
//       //self.navigationController?.navigationBar.barTintColor = UIColor.clearColor()
//        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
//        //self.navigationController?.navigationBar.
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        backHome.backgroundColor = UIColor.clearColor()
        backHome.layer.borderWidth = 1.0
        backHome.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        backHome.layer.cornerRadius = cornerRadius
        //super.viewWillAppear(true)
        self.viewWillAppear(true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
