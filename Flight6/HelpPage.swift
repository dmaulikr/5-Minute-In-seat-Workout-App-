//
//  HelpPage.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/21/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit

class HelpPage: UIViewController {
    
    //buttons and labels from the storyboard
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var aboutDetail: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    //border and corner settings for button
    let borderAlpha : CGFloat = 0.7
    let cornerRadius : CGFloat = 5.0
    override func viewDidLoad() {
        super.viewDidLoad()
        homeBtn.backgroundColor = UIColor.clearColor()
        homeBtn.layer.borderWidth = 1.0
        homeBtn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        homeBtn.layer.cornerRadius = cornerRadius
        
        let color7 = UIColor.flatNavyBlueColorDark()
        let color1 = UIColor(hue: 0.9528, saturation: 0.4, brightness: 1, alpha: 1.0) /* #ff759d */
        setTableViewBackgroundGradient(color7, bottomColor: color1);
        view.addSubview(aboutLabel)
        view.addSubview(aboutDetail)
        view.addSubview(homeBtn)
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
        
        
    }
    


}
