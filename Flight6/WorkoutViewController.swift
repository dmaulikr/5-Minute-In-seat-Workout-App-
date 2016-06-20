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

class WorkoutViewController: UIViewController, MZTimerLabelDelegate {

    @IBOutlet weak var backHome: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: MZTimerLabel!
    
    @IBOutlet weak var workoutLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var nextUp: UILabel!
    
    @IBOutlet weak var progressTimer: MBCircularProgressBarView!
    
    
    @IBAction func stopMZTimerLabel(sender: UIButton) {
        if sender.currentTitle == "Back to Homepage" {
            
            timerLabel.pause()
        }
        
        
        
    }
    @IBAction func pauseResume(sender: UIButton) {
        
        let propertyToCheck = sender.currentTitle!
        
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
        let restTime = 11.0
        let workoutTimeLong = 30.0
        let workoutTimeShort = 60.0
        var index = 0;
        var count = 0;
        let dataSource = WorkoutDataSource()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        var workouts: [Workout]!
        var workouts2: [Workout]!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
                    self.progressTimer.setValue(55, animateWithDuration: 1)
                    timerLabel.delegate = self
                    timerLabel.timerType = MZTimerLabelTypeTimer
                    timerLabel.setCountDownTime(10)
                    timerLabel.timeFormat = "ss"
                    timerLabel.resetTimerAfterFinish = true
                    timerLabel.start()
            workouts = dataSource.getWorkOuts()
            workouts2 = dataSource.getWorkOuts2()
            workoutLabel.text = workouts2[0].title
            
            self.navigationController?.navigationBar.titleTextAttributes = ([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 36)!, NSForegroundColorAttributeName: UIColor.whiteColor()])
             view.backgroundColor = UIColor.flatNavyBlueColorDark()
            buttonUI(pauseButton)
            buttonUI(backHome)
            
            
            
        }
    
        func buttonUI(button: UIButton) {
            button.backgroundColor = UIColor.clearColor()
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
            button.layer.cornerRadius = cornerRadius
            
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        //go through workout2 array
        //set time in workout2 array
        let workoutRoutine = workouts2
        
    
//            let wk = workouts2[count]
//            timerLabel.text = "\(workoutTime)"
//            mainLabel.text = wk.title
//            self.view.backgroundColor = wk.color
//            timerLabel.setCountDownTime(workoutTime);
//            workoutLabel.text = "Rest !!"
//            
//        
//        count++;
        //count = 0;
        
       // if index % 2 == 0 {
            let wk = workouts2[index]
        
            mainLabel.text = wk.title
            self.view.backgroundColor = wk.color
        
                
                
                
                //setValue:55.f animateWithDuration:1];
        if wk.title == "Neck Rolls" || wk.title == "Feet Circles" ||
            wk.title == "Shoulder Rolls" || wk.title == "Trunk Twister"  {
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
        
            workoutLabel.text = workouts2[index+1].title
            println(index)
       // } else {
//            let wk = workouts[index / 2 + 1]
//            timerLabel.text = "\(restTime)"
//            mainLabel.text = "Rest !!"
//            self.view.backgroundColor = wk.color
//            timerLabel.setCountDownTime(restTime);
//            workoutLabel.text = wk.title
//            println(index)
       // }
        
        index++;
        if !((index / 2) > workouts.count) {
            timerLabel.start()
        } else {
            println("Workout done")
        }
    }
    
}
