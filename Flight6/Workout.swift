//
//  Workout.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import Foundation
import UIKit

class Workout {
    var videoId: String!
    var title: String!
    var workoutText: String!
    var color: UIColor!
    
    init(title: String, videoId: String, workoutText: String, color: UIColor){
        self.videoId = videoId
        self.title = title
        self.workoutText = workoutText
        self.color = color
    }
    
    
    
}