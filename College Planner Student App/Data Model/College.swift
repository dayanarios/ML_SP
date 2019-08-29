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
    
    init(name : String , dueDate : Date) {
        self.name = name
        self.dueDate = dueDate
    }
}
