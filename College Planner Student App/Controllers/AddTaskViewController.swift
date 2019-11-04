//
//  AddTaskViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 10/24/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit
import TextFieldEffects

protocol taskData {
    func taskAdded(task : Task)
}

class AddTaskViewController: UIViewController {
    
    @IBOutlet var alertButtons : [UIButton]!

    @IBOutlet weak var taskName: HoshiTextField!
    
    
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var taskDueDate: UIDatePicker!
    
    var alert = 3
    var delegate : taskData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let task = Task()
        task.name = taskName.text ?? "no name assigned"
        task.notes = notesTextView.text
        task.dueDate = taskDueDate.date
        delegate?.taskAdded(task: task)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func alertButtonPressed(_ sender: UIButton) {
        setAlerts(tag: sender.tag)
    }
    
    func setAlerts(tag: Int){
        
        print(tag)
        switch tag {
        case 1: alert = 1 //weekly
        break;
        case 2: alert = 2 //daily
        break;
        default: alert = 3 //none
        break;
        }
        
        for button in alertButtons{
            if button.tag == tag {
                button.isSelected = true
                button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                button.setTitleColor(UIColor .white, for: .normal)
            }
            else{
                button.isSelected = false
                button.backgroundColor = UIColor .white
                button.setTitleColor(UIColor .black, for: .normal)
                
            }
            
        }
    }
    
}
