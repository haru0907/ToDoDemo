//
//  RealmManager.swift
//  ToDoDemo
//
//  Created by JSNPC-0041 on 2022/11/28.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject    {
    private (set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init(){
        openRealm()
        getTasks()
        print("dd")
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            print("dd")
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }catch{
            print("Errow opening Realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Task(value:[ "title":taskTitle,"completed":false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm:\(newTask)")
                }
            }catch{
                print("Errow adding task to Realm: \(error)")
            }
        }
    }
    
    func getTasks(){
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach{task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id:ObjectId,completed:Bool){
        ///書き込みエラーチェック
        if let localRealm = localRealm {
            do{
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with id \(id)! Completed status \(completed)")
                }
            }catch{
                print("Errow updting task \(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteTask(id:ObjectId){
        if let localRealm = localRealm {
            do{
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(taskToDelete)
                    getTasks()
                }
            }catch{
                print("Error delete \(id) from Realm: \(error)")
            }
        }
    }
}
