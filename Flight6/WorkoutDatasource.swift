//
//  WorkoutDatasource.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import Foundation
import UIKit

class WorkoutDataSource{
    var workouts:[Workout]
    var workouts2:[Workout]
    
    init() {
        workouts = []
        workouts2 = []
        let wk1 = Workout(title: "Warm-Up", workoutText: "1. Circle your feet. 2. Circle your wrists. 3. Raise you arms up and down.",color: UIColor(hue: 0.5, saturation: 1, brightness: 0.33, alpha: 1.0) /* #005555 */)
        workouts.append(wk1)
        workouts2.append(wk1)
        
        
        let rest1 = Workout(title: "Rest", workoutText: "Take deep breaths and calm your nerves.", color: UIColor(hue: 0.5, saturation: 1, brightness: 0.33, alpha: 1.0))
        workouts2.append(rest1)
        
        let wk2 = Workout(title: "Leg Lifts", workoutText: "Lift your legs up without touching the ground.", color:  UIColor(hue: 0.5, saturation: 1, brightness: 0.4, alpha: 1.0) /* #006666 */)
        workouts.append(wk2)
        workouts2.append(wk2)
        
        let rest2 = Workout(title: "Rest", workoutText: "Take deep breaths and calm your nerves.", color: UIColor(hue: 0.5, saturation: 1, brightness: 0.4, alpha: 1.0) /* #006666 */)
        workouts2.append(rest2)
        
        let wk3 = Workout(title: "Stand on fists", workoutText: "Put your fists by your side and lift yourself up.", color:  UIColor(hue: 0.5, saturation: 1, brightness: 0.46, alpha: 1.0) /* #007777 */)
        workouts.append(wk3)
        workouts2.append(wk3)
        
        let rest3 = Workout(title: "Rest", workoutText: "Take deep breaths and calm your nerves.", color:  UIColor(hue: 0.5, saturation: 1, brightness: 0.46, alpha: 1.0) /* #007777 */)
        workouts2.append(rest3)
        
        let wk4 = Workout(title: "Neck Rolls", workoutText: "Roll your neck clockwise for 15 secs and switch to counter-clockwise for the next 15 secs.", color: UIColor(hue: 0.5361, saturation: 0.76, brightness: 0.4, alpha: 1.0) /* #185567 */)
        workouts.append(wk4)
        workouts2.append(wk4)
        
        let wk5 = Workout(title: "Feet Circles", workoutText: "Circle your feet in the clockwise direction for 15 secs and switch to counter-clockwise for the next 15 secs.", color:  UIColor(hue: 0.6194, saturation: 0.5, brightness: 0.36, alpha: 1.0) /* #2f3c5e */)
        workouts.append(wk5)
        workouts2.append(wk5)
        
        let wk6 = Workout(title: "Shoulder Rolls", workoutText: "Roll your shoulders in the clockwise direction for 15 secs and switch to counter-clockwise for the next 15 secs.", color:  UIColor(hue: 0.7861, saturation: 0.6, brightness: 0.33, alpha: 1.0) /* #472255 */)
        workouts.append(wk6)
        workouts2.append(wk6)
        
        let rest4 = Workout(title: "Rest", workoutText: "Take deep breaths and calm your nerves.", color:  UIColor(hue: 0.7861, saturation: 0.6, brightness: 0.33, alpha: 1.0) /* #472255 */)
        workouts2.append(rest4)
        
        let wk7 = Workout(title: "Stand on Fists (Harder)", workoutText: "Put your hands on the handles of your seat and lift yourself.", color:  UIColor(hue: 0.8722, saturation: 0.91, brightness: 0.37, alpha: 1.0) /* #5f084c */)
        workouts.append(wk7)
        workouts2.append(wk7)
        
        let rest5 = Workout(title: "Rest", workoutText: "Take deep breaths and calm your nerves.", color:  UIColor(hue: 0.7861, saturation: 0.6, brightness: 0.33, alpha: 1.0) /* #472255 */)
        workouts2.append(rest5)
        
        let wk8 = Workout(title: "Trunk Twister", workoutText: "Twist yourself.", color:  UIColor(hue: 0.8722, saturation: 0.91, brightness: 0.37, alpha: 1.0) /* #5f084c */)
        workouts.append(wk8)
        workouts2.append(wk8)
    }
    
    func getWorkOuts() -> [Workout]{
        return workouts
    }
    
    func getWorkOuts2() -> [Workout]{
        return workouts2
    }
    
    
    
}