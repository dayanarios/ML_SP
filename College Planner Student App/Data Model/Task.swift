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
    @objc dynamic var alerts = 3
    @objc dynamic var notes = ""
    @objc dynamic var dueDate : Date = Date()
    

}
