//
//  TaskRow.swift
//  ToDoDemo
//
//  Created by JSNPC-0041 on 2022/11/26.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing:20){
            Image(systemName:completed ? "checkmark.circle" :"circle")
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "洗濯", completed: true)
    }
}
