//
//  MainViewController.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit
import ChameleonFramework

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var button: UIButton!
    let manager = WorkoutDataSource()
    var workouts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.workouts = manager.getWorkOuts()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        
        button.backgroundColor = UIColor.clearColor()
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        button.layer.cornerRadius = cornerRadius
        
        let heightOfVisibleTableViewArea = tableView.bounds.height - topLayoutGuide.length - bottomLayoutGuide.length
        let numberOfRows = tableView.numberOfRowsInSection(0)
        
         tableView.rowHeight = heightOfVisibleTableViewArea / CGFloat(numberOfRows)
        
        let color1 = UIColor(hue: 0.9528, saturation: 0.4, brightness: 1, alpha: 1.0) /* #ff759d */
        let color2 = UIColor(hue: 0.0167, saturation: 0.25, brightness: 0.95, alpha: 1.0) /* #ffb1b1 */
        let color3 = UIColor(hue: 0.2528, saturation: 0.11, brightness: 0.85, alpha: 1.0) /* #f3bbb4 */
        let color4 =  UIColor(hue: 0.3833, saturation: 0.21, brightness: 0.91, alpha: 1.0) /* #cedbc2 */
        let color5 = UIColor(hue: 0.4417, saturation: 0.62, brightness: 0.97, alpha: 1.0) /* #b7eac7 */
        let color6 = UIColor(hue: 0.4528, saturation: 0.91, brightness: 0.81, alpha: 1.0) /* #12d19e */ /* #5ef9c3 */
        
        let color7 = UIColor.flatNavyBlueColorDark()
    
        view.backgroundColor = UIColor.flatNavyBlueColorDark()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        setTableViewBackgroundGradient(color7, bottomColor: color1)
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.workouts.count
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
            tableView.backgroundView = backgroundView
        }
    
    
    
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
            let workout = self.workouts[indexPath.row] as? Workout
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? WorkoutCell
            cell!.textCellLabel?.text = workout?.title
            cell!.backgroundColor = workout?.color
            cell!.countLabel.text = "\(indexPath.row+1)"
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            cell!.backgroundColor = UIColor.clearColor()
            return cell!
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailview"){
            let cell = sender as? WorkoutCell
                        let indexPath = tableView.indexPathForCell(cell!)
            let nvc = segue.destinationViewController as? UINavigationController
                        if let tmp = workouts[indexPath!.row] as? Workout{
                            let dvc = nvc?.topViewController as! DetailViewController
                            dvc.workout = tmp
                        }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}