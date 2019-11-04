//
//  College.swift
//  College Planner Student App
//
//  Created by Dayana on 8/27/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ChameleonFramework

class College: Object {
    //var progressBar will be inside of the view added
     @objc dynamic var name : String = ""
     @objc dynamic var dueDate : Date = Date()
     let  tasks = List<Task>()
     @objc dynamic var notes : String = ""
     @objc dynamic var progress = CGFloat(0)
     @objc dynamic var completedTasks : Int = 0
    @objc dynamic var priority = 3
    @objc dynamic var color = 3
    

    
    func addTask(task : Task){
        tasks.append(task)
        updateProgress()
    }
    
    //returns the date as a string
    func getDate() -> String {
        
        let date : Date = self.dueDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        //dateFormatter.dateFormat = "MMMM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: date)
        
    }
    
    func updateProgress() {
        completedTasks = 0
        
        for task in tasks{
            if task.done {
                completedTasks += 1
            }
        }
        
        progress = CGFloat(completedTasks) /  CGFloat(tasks.count)
        print(progress)
        
    }
    
    func getColor() -> UIColor{
        switch (color){
        case 1: return UIColor.flatRed
        case 2: return UIColor.flatYellow
        default: return UIColor.flatGreenDark
        }
    }
    
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    func checkDueDate(){
        let diff = daysBetween(start: Date(), end: dueDate)
        
        if (diff <= 7){
            color = 1
        }
        else if (diff <= 14){
            color = 2
        }
        else {
            color = 3
        }
    }
    

}
