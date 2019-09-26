//
//  TaskViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/29/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var college : College?
    
    
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
        collegeNameLabel.text = college?.name
        dueDateLabel.text = "Due: " + (college?.getDate())!
        notesTextView.text = college?.notes

        

    }
    
    //MARK: - Table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college?.tasks.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        cell.textLabel?.text = college!.tasks[indexPath.row].name
        
        //toggles checkmark depending on done status
        cell.accessoryType = college!.tasks[indexPath.row].done ? .checkmark : .none
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //toggle the checkmark if the item is not nil
        //update attribute in our realm db
        if let task = college?.tasks[indexPath.row]{
                task.done = !task.done
        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - task button pressed
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        
        //creates a popup to collet task info
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add Task", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let taskName = textField.text!
            let newTask : Task = Task(name: taskName)
            self.college?.addTask(task: newTask)
            self.taskTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add new Item"
            
        }
        
        present(alert, animated: true, completion: nil)
        

    }
    

    

}
