//
//  TaskViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/29/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit
import CircleProgressBar
import RealmSwift

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks : Results<Task>?
    let realm = try! Realm()
    
    var college : College?{
        didSet{
            loadItems()
        }
    }
    
    @IBOutlet weak var progressBar: CircleProgressBar!
    
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
        progressBar.setProgress(college?.progress ?? 0, animated: true)

        

    }
    
    //MARK: - Table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        if let task = tasks?[indexPath.row]{
            cell.textLabel?.text = task.name
            //toggles checkmark depending on done status
            cell.accessoryType = task.done ? .checkmark : .none
        }else{
            cell.textLabel?.text = "no task added"
        }
        
        let progressColor = college?.getColor()
        progressBar.progressBarProgressColor = progressColor
        progressBar.hintViewBackgroundColor = progressColor
        progressBar.setProgress(college?.progress ?? 0, animated: true)
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //toggle the checkmark if the item is not nil
        //update attribute in our realm db
        if let task = tasks?[indexPath.row]{
            do{
                try realm.write {
                    task.done = !task.done
                }
            }catch {
                print("error updating task status, \("error")")
            }
            
        }

        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let currentCollege = self.college{
            do{
                try self.realm.write {
                    currentCollege.updateProgress()
                }
            }catch {
                print("error updating college progress \("error")")
            }
        }
        
        progressBar.setProgress(college?.progress ?? 0, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            do {
                try realm.write {
                    realm.delete((tasks?[indexPath.row])!)
                    college?.updateProgress()
                }
            }
            catch{
                print("error deleting item, \("error")")
            }
            //tasks.remove(at: indexPath.row)
            
            self.progressBar.setProgress(self.college?.progress ?? 0, animated: true)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    //MARK: - task button pressed
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        
        //creates a popup to collet task info
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add Task", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            if let currentCollege = self.college{
                do {
                    try self.realm.write {
                        let newTask = Task()
                        newTask.name = textField.text!
                        currentCollege.addTask(task: newTask)
                    }
                } catch {
                    print("error saving task \(error)")
                }

            }
            self.progressBar.setProgress(self.college?.progress ?? 0, animated: true)
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
    
    //MARK: - task manipulation methods
    
    func loadItems(){
        tasks = college?.tasks.sorted(byKeyPath: "name", ascending: true)
        //taskTableView.reloadData() //is causing an error
    }
    

    

}
