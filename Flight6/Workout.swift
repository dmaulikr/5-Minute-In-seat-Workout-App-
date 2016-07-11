//
//  Workout.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import Foundation
import UIKit

/*Workout class and attributes*/
class Workout {
    
    var title: String!
    var workoutText: String!
    var color: UIColor!
    
    init(title: String, workoutText: String, color: UIColor){
        self.title = title
        self.workoutText = workoutText
        self.color = color
    }
}