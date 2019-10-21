//
//  CollegeCell.swift
//  College Planner Student App
//
//  Created by Dayana on 8/27/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit
import CircleProgressBar

class CollegeCell: UITableViewCell {

    @IBOutlet weak var collegeStatusView: UIView! {
        didSet{
            collegeStatusView.layer.cornerRadius = 10
            collegeStatusView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    
    @IBOutlet weak var progressBar: CircleProgressBar!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var collegeNameLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {

            containerView.layer.shadowColor = UIColor.darkGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            containerView.layer.shadowOpacity = 1.0
            containerView.layer.shadowRadius = 2

        }
    }
    
    func setCollegeCell(college : College?){
        collegeNameLabel.text = college?.name ?? "No college name set"
        dueDateLabel.text = college?.getDate() ?? "No date set"
        progressBar.setProgress(college?.progress ?? 0, animated: true)
    }
    
}
