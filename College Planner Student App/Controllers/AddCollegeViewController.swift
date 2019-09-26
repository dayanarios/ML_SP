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
    

    @IBOutlet weak var collegeTextField: HoshiTextField!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    var delegate : collegeData?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        
        
        let task1 : Task = Task(name : "parent demographics")

        
        let newCollege : College = College(name : collegeTextField.text ?? " ", dueDate : dueDatePicker.date, tasks : [task1], notes : notesTextView.text)
        
        delegate?.collegeAdded(college: newCollege)
        self.navigationController?.popViewController(animated: true)
    }
    



}
