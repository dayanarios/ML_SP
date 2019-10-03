//
//  Task.swift
//  College Planner Student App
//
//  Created by Dayana on 8/29/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var done : Bool = false
    var parentCollege = LinkingObjects(fromType: College.self, property: "tasks")
    
    //creating a one to one relationship with a Category object
    //items is the name of list of a categories items
    //var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
//    init(name : String) {
//        self.name = name
//    }
}
