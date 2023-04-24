//
//  Task.swift
//  ToDoDemo
//
//  Created by JSNPC-0041 on 2022/11/28.
//

import Foundation
import RealmSwift

class Task: Object , ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id : ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
    
}
