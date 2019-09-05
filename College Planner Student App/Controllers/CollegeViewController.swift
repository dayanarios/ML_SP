//
//  CollegeViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/28/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit

class CollegeViewController: UITableViewController {
    
    var colleges : [College] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colleges = createArray()
        
        
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
        
        //cell.textLabel?.text = colleges[indexPath.row]
        cell.collegeNameLabel.text = colleges[indexPath.row].name
        
        //TODO: - Change date
        cell.dueDateLabel.text = "Due: " + colleges[indexPath.row].getDate()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToTasks", sender: self)
    }
    
    //MARK: - Segue Methods
    
    //sends data to second view controller for display
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTasks" {
            
            let taskVC = segue.destination as! TaskViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                taskVC.collegeName = colleges[indexPath.row].name
                taskVC.dueDate = colleges[indexPath.row].getDate()
                taskVC.tasks = colleges[indexPath.row].tasks
                
                //destinationVC.selectedCategory = categories?[indexPath.row]
            }
            
            
            

            
            //secondVC.delegate = self        //stating this VC will handle data coming from secondVC
            //print(secondVC.data)
        }
    }
    
    
    //MARK: - Add Task Button Methods
    
    
    @IBAction func addCollegeButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    
    //MARK: - College Manipulation Methods
    
    func saveCollege(newCollege : College){
        colleges.append(newCollege)
    }
    

    func createArray() -> [College]{
        var tempColleges : [College] = []
        //var tempColleges : [String] = []
        
        let task1 : Task = Task(name : "parent demographics")
        let task2 : Task = Task(name : "student demographics")
        let task3 : Task = Task(name : "academics")
        let task4 : Task = Task(name : "personal essays")
        let task5 : Task = Task(name : "activities")
        
        let tasks1 : [Task] = [task1, task2, task3, task4, task5]
        let tasks2 : [Task] = [task5, task4, task3, task2, task1, task5, task4, task3, task2, task1]
        let tasks3 : [Task] = [task1, task3, task5, task4, task2]
        let tasks4 : [Task] = [task2, task4, task3, task1, task5]
        
        let t1 : College = College(name : "UCLA", dueDate : Date(), tasks : tasks1)
        let t2 : College = College(name : "USC", dueDate : Date(), tasks : tasks2)
        let t3 : College = College(name : "Cal", dueDate : Date(), tasks :tasks3)
        let t4 : College = College(name : "Stanford", dueDate : Date(), tasks :tasks4)
        
        tempColleges.append(t1)
        tempColleges.append(t2)
        tempColleges.append(t3)
        tempColleges.append(t4)
        
        return tempColleges
    }


}
