//
//  AddTaskView.swift
//  ToDoDemo
//
//  Created by JSNPC-0041 on 2022/11/26.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManeger: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            Text("Create New Task")
                .font(.title3).bold()
                .frame(maxWidth:.infinity,alignment: .leading)
            
            TextField("Enter your Task",text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                if title != ""{
                    realmManeger.addTask(taskTitle: title)
                }
                
                dismiss()
            }label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue:0.328,saturation: 0.796,brightness: 0.408))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top,40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
