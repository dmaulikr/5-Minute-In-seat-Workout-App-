//
//  MainViewController.swift
//  Flight6
//
//  Created by Hashma Shahid on 6/19/16.
//  Copyright (c) 2016 Hashma Shahid. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   
    let manager = WorkoutDataSource()
    var workouts = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.workouts = manager.getWorkOuts()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.workouts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let workout = self.workouts[indexPath.row] as? Workout
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? WorkoutCell!
    //cell!.textCell?.text = workout?.title
    cell!.backgroundColor = workout?.color
    cell!.countLabel.text = "\(indexPath.row+1)"
    cell!.selectionStyle = UITableViewCellSelectionStyle.None
    return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailview"){
            let cell = sender as? WorkoutCell
            let indexPath = tableView.indexPathForCell(cell!)
            let nvc = segue.destinationViewController as? UINavigationController
            if let tmp = workouts[indexPath!.row] as? Workout{
                //let dvc = nvc?.topViewController as! DetailViewController
                //dvc.workout = tmp
            }
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.contentInset = UIEdgeInsetsMake(0,0,55,0)
    }
    
}