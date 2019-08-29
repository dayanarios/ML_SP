//
//  CollegeCell.swift
//  College Planner Student App
//
//  Created by Dayana on 8/27/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit

class CollegeCell: UITableViewCell {


    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var collegeNameLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
//            containerView.layer.cornerRadius = 10
//            containerView.layer.shadowOpacity = 1
//            containerView.layer.shadowRadius = 2
//            containerView.layer.shadowColor = UIColor(named: "blue")?.cgColor
//            containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
//            containerView.backgroundColor = UIColor(named: "cyan")
            //containerView.layer.masksToBounds = true
            
            
            containerView.backgroundColor = UIColor.clear
            containerView.layer.shadowColor = UIColor.darkGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            containerView.layer.shadowOpacity = 1.0
            containerView.layer.shadowRadius = 2
            

            
            //containerView.clipsToBounds = true
        }
    }
    
    func setCollegeCell(college : College){
        collegeNameLabel.text = college.name
        
        let date : Date = college.dueDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMMM-dd-yyyy"
        let dateString = dateFormatter.string(from: date)
        
        dueDateLabel.text = dateString
    }
    
}
