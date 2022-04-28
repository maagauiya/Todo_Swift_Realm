//
//  Todo.swift
//  Bekarys_Magauiya_Realm
//
//  Created by Bekarys Magauiya on 28.04.2022.
//

import Foundation
import RealmSwift


class Todo: Object {
    @Persisted var taskname: String = ""
    @Persisted var taskdescription: String = ""
    @Persisted var taskstatus: Int?
}
