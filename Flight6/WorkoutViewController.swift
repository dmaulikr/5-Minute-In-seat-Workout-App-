//
//  WorkoutViewController.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit
import MZTimerLabel
import MBCircularProgressBar
import JWGCircleCounter

class WorkoutViewController: UIViewController, MZTimerLabelDelegate {

    @IBOutlet weak var backHome: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: MZTimerLabel!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var nextUp: UILabel!
    @IBOutlet weak var progressTimer: JWGCircleCounter!
    @IBOutlet weak var descriptionLabel: UILabel!
    //constants
    let restTime = 5.0
    let workoutTimeLong = 5.0
    let workoutTimeShort = 5.0
    let dataSource = WorkoutDataSource()
    let borderAlpha : CGFloat = 0.7
    let cornerRadius : CGFloat = 5.0
    
    //variables
    var index = 0;
    var count = 0;
    var workouts: [Workout]!
    var workouts2: [Workout]!
    
    //stop timer if user returns to home
    @IBAction func stopMZTimerLabel(sender: UIButton!) {
        
        if sender.currentTitle == "Back to Homepage" {
            timerLabel.pause()
        }
        
    }
    
    @IBAction func pauseResumeButton(sender: AnyObject) {
        
        //let propertyToCheck = sender.currentTitle!
        
        //set pause and resume button functions
        if sender.currentTitle == "Pause" {
            // do something
            pauseButton.setTitle("Resume", forState: .Normal)
            timerLabel.pause()
        }
            
        else if (sender.currentTitle == "Resume") {
            // do something else
            pauseButton.setTitle("Pause", forState: .Normal)
            timerLabel.start()
        }
    }
   
    
        override func viewDidLoad() {
            
            super.viewDidLoad()
            timerLabel.delegate = self
            timerLabel.timerType = MZTimerLabelTypeTimer
            timerLabel.setCountDownTime(1)
            timerLabel.timeFormat = "ss"
            timerLabel.resetTimerAfterFinish = true
            timerLabel.start()
            workouts = dataSource.getWorkOuts()
            workouts2 = dataSource.getWorkOuts2()
            workoutLabel.text = workouts2[0].title
            self.navigationController?.navigationBar.titleTextAttributes = ([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 36)!, NSForegroundColorAttributeName: UIColor.whiteColor()])
             view.backgroundColor = UIColor.flatNavyBlueColorDark()
            setButtonStyleOf(pauseButton)
            setButtonStyleOf(backHome)
            
        }
    
        func setButtonStyleOf(button: UIButton) {
            
            button.backgroundColor = UIColor.clearColor()
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
            button.layer.cornerRadius = cornerRadius
            
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        
        let workoutRoutine = workouts2
        let wk = workouts2[index]
        
        mainLabel.text = wk.title
        descriptionLabel.text = wk.workoutText
        self.view.backgroundColor = wk.color
        self.navigationController?.navigationItem.title = wk.title
        
        //use indices
        if wk.title == "Neck Rolls" || wk.title == "Feet Circles" ||
            wk.title == "Shoulder Rolls" || wk.title == "Trunk Twister" || wk.title == "Warm-Up"  {
                timerLabel.setCountDownTime(workoutTimeShort);
                timerLabel.text = "\(workoutTimeShort)"
        }
            
        else if wk.title == "Rest" {
            timerLabel.setCountDownTime(restTime);
            timerLabel.text = "\(restTime)"
        }
        
        else {
            timerLabel.setCountDownTime(workoutTimeShort);
            timerLabel.text = "\(workoutTimeLong)"
        }
        
        if (index+1 < workouts2.endIndex) {
             workoutLabel.text = workouts2[index+1].title
            print(index + 1)
            print("End")
            print(workouts2.endIndex)
        }
        
        else {
            workoutLabel.text = "End Workout"}
        
        if (index < workouts2.endIndex-1) {
            index = index + 1;
        }
        
        else {
            timerLabel.pause();
            timerLabel.reset();
            performSegueWithIdentifier("endWorkout", sender: self)
            return;
        }
        
        if !((index / 2) > workouts.count) {
            timerLabel.start()
        } else {
            print("Workout done")
        }
    }
}
