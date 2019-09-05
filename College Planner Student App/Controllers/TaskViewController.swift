//
//  TaskViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/29/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var collegeName : String = ""
    var dueDate : String = ""
    var tasks : [Task] = []
    

    
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var collegeNameLabel: UILabel!
    
    @IBOutlet weak var taskTableView: UITableView!
    
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // table view delegets
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        // view setup
        collegeNameLabel.text = collegeName
        dueDateLabel.text = "Due: " + dueDate
        

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row].name
        
        return cell
        
        
    }
    

    

}
