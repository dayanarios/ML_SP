//
//  College.swift
//  College Planner Student App
//
//  Created by Dayana on 8/27/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import Foundation

class College {
    //var progressBar will be inside of the view added
    var name : String = ""
    var dueDate : Date
    var tasks : [Task] = []
    
    init(name : String , dueDate : Date, tasks : [Task]) {
        self.name = name
        self.dueDate = dueDate
        self.tasks = tasks
    }
    
    func addTask(task : Task){
        tasks.append(task)
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
}
