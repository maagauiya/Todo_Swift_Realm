//
//  RealmManager.swift
//  Bekarys_Magauiya_Realm
//
//  Created by Bekarys Magauiya on 28.04.2022.
//

//import Foundation
import RealmSwift
import Foundation

class RealmManager  {
    
    static var shared = RealmManager()
    var  tasks = [Todo]()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    
    func saveTask(taskname:String,taskdescription:String,status:Int){
        try! realm.write{
            let task = Todo()
            task.taskname=taskname
            task.taskdescription=taskdescription
            task.taskstatus=status
            realm.add(task)
        }
    }
    
    
    func loadtasks() -> [Todo]{
        tasks.removeAll()
        self.realm.beginWrite()
        let w = realm.objects(Todo.self)
        for i in w{
            tasks.append(i)
        }
        try! self.realm.commitWrite()
        return tasks
    }
    
    func delete(index: Int){
        self.realm.beginWrite()
        
        let e = realm.objects(Todo.self)
        var a = 0
        for i in e {
            if a==index{
                realm.delete(i)
            }
            a=a+1
        }
       try! self.realm.commitWrite()
    }
    
    func update(index: Int,taskname:String,taskdescription:String,status:Int){
        let e = realm.objects(Todo.self)
        var a = 0
        for i in e {
            if a==index{
                try! realm.write{
                    i.taskname=taskname
                    i.taskdescription=taskdescription
                    i.taskstatus=status
                }
            }
            a=a+1
        }
    }
    
}
