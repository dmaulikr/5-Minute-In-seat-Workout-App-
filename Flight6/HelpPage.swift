//
//  HelpPage.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/21/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit

class HelpPage: UIViewController {
    
    @IBOutlet weak var aboutLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let color7 = UIColor.flatNavyBlueColorDark()
        let color1 = UIColor(hue: 0.9528, saturation: 0.4, brightness: 1, alpha: 1.0) /* #ff759d */
        setTableViewBackgroundGradient(color7, bottomColor: color1);
    }
    
    func setTableViewBackgroundGradient(topColor: UIColor, bottomColor: UIColor){
        
        let gradientBackgroundColors = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = view.bounds
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, atIndex: 0)
        view.addSubview(backgroundView)
        view.addSubview(aboutLabel)
        
    }
    


}
