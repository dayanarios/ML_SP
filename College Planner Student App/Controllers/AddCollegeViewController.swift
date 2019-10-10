//
//  AddCollegeViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 9/5/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit
import TextFieldEffects

protocol collegeData {
    func collegeAdded(college : College)
}

class AddCollegeViewController: UIViewController {
    
    @IBOutlet var priorityButtons : [UIButton]!
    
    @IBOutlet weak var collegeTextField: HoshiTextField!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    var delegate : collegeData?
    
    var priority = 3

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let task1 : Task = Task()
        task1.name = "parent demographics"

        
        let newCollege = College()
        newCollege.name = collegeTextField.text ?? " "
        newCollege.dueDate = dueDatePicker.date
        newCollege.tasks.append(task1)
        newCollege.notes = notesTextView.text
        newCollege.priority = priority
        
        delegate?.collegeAdded(college: newCollege)
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func priorityButtonPressed(_ sender: UIButton) {
        //linked up buttons
        setPriority(tag: sender.tag)
        
    }
    
    func setPriority(tag: Int){
        print(tag)
        switch tag {
        case 1: priority = 1 //high
            break;
        case 2: priority = 2 //medium
            break;
        default: priority = 3 //low
            break;
        }
        
        for button in priorityButtons{
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
