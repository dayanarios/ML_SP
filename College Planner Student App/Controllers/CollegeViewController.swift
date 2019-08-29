//
//  CollegeViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/28/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit

class CollegeViewController: UITableViewController {
    
    var colleges : [String] = ["UCLA", "USC", "CSULB", "Cal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        //automatically resizes cells based on content
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colleges.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath) as! CollegeCell
        
        cell.selectionStyle = .none
        
//        cell.containerView.layer.cornerRadius = 10
//        cell.containerView.layer.masksToBounds = true
//        
        //cell.textLabel?.text = colleges[indexPath.row]
        cell.collegeNameLabel.text = colleges[indexPath.row]
        cell.dueDateLabel.text = colleges[indexPath.row]
        print(colleges[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToTasks", sender: self)
    }

    func createArray() -> [String]{
        var tempColleges : [String] = []
        
        tempColleges.append("UCLA")
        tempColleges.append("USC")
        tempColleges.append("CSULB")
        tempColleges.append("Cal")
        
        return tempColleges
    }


}
