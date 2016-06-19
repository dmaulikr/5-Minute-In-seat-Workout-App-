//
//  WorkoutViewController.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit
import MZTimerLabel

class WorkoutViewController: UIViewController, MZTimerLabelDelegate {

    @IBOutlet weak var backHome: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: MZTimerLabel!
    
    @IBOutlet weak var currentWorkout: UILabel!
    
    @IBOutlet weak var nextUp: UILabel!
    
    @IBOutlet weak var nextWorkout: UILabel!
    
    
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
        let workoutTime = 30.0
        var index = 5;
        let dataSource = WorkoutDataSource()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        var workouts: [Workout]!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
                    timerLabel.delegate = self
                    timerLabel.timerType = MZTimerLabelTypeTimer
                    timerLabel.setCountDownTime(10)
                    timerLabel.timeFormat = "ss"
                    timerLabel.resetTimerAfterFinish = true
                    timerLabel.start()
            workouts = dataSource.getWorkOuts()
            currentWorkout.text = workouts[0].title
            self.navigationController?.navigationBar.barTintColor = workouts[0].color
            self.navigationController?.navigationBar.backgroundColor = workouts[0].color
            self.navigationController?.navigationBar.titleTextAttributes = ([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 36)!, NSForegroundColorAttributeName: UIColor.whiteColor()])
             view.backgroundColor = UIColor.flatNavyBlueColorDark()
            buttonUI(pauseButton)
            buttonUI(backHome)
            
            
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func buttonUI(button: UIButton) {
            button.backgroundColor = UIColor.clearColor()
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
            button.layer.cornerRadius = cornerRadius
            
        }
        
        func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
            
            if index % 2 == 0 {
                let wk = workouts[index / 2]
                timerLabel.text = "\(workoutTime)"
                currentWorkout.text = wk.title
                self.view.backgroundColor = wk.color
                timerLabel.setCountDownTime(workoutTime);
                nextWorkout.text = "Rest !!"
                self.navigationController?.navigationBar.barTintColor = wk.color
            } else {
                let wk = workouts[index / 2 + 1]
                timerLabel.text = "\(restTime)"
                currentWorkout.text = "Rest !!"
                self.view.backgroundColor = wk.color
                timerLabel.setCountDownTime(restTime);
                nextWorkout.text = wk.title
                self.navigationController?.navigationBar.barTintColor = wk.color
            }
            
            index++;
            if !((index/2) > workouts.count) {
                timerLabel.start()
            } else {
                println("Workout done")
            }
    }
    
    
}
