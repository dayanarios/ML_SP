//
//  CollegeViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/28/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit
import CircleProgressBar
import RealmSwift
import ChameleonFramework

class CollegeViewController: UITableViewController, collegeData {
    

    var colleges : Results<College>?
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadColleges()
        
        
        tableView.separatorStyle = .none
        
        //automatically resizes cells based on content
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return colleges?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath) as! CollegeCell
        
        cell.selectionStyle = .none
        
        let college = colleges?[indexPath.row]
        
        cell.setCollegeCell(college: college)
        
        let progressColor = college?.getColor()
        cell.progressBar.progressBarProgressColor = progressColor
        cell.progressBar.hintViewBackgroundColor = progressColor

        
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
                
                taskVC.college = colleges?[indexPath.row] 
                
                
            }

        }
        else if segue.identifier == "goToAddCollege"{
            let collegeVC = segue.destination as! AddCollegeViewController
            collegeVC.delegate = self
            
        }
    }
    
    
    //MARK: - Add College Button Methods
    
    
    @IBAction func addCollegeButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddCollege", sender: self)
    }
    
    //MARK: - College Added protocol
    
    func collegeAdded(college: College) {
        print(college.name)
        saveCollege(newCollege: college)
    }
    
    //MARK: - College Manipulation Methods
    
    func saveCollege(newCollege : College){
        
        do{
            try realm.write {
                newCollege.updateProgress()
                realm.add(newCollege)
            }
        } catch {
            print("error saving added college \(error)")
        }
        
        //tableView.reloadData()
    }

    func loadColleges(){
        colleges = realm.objects(College.self)
    }
    



}
