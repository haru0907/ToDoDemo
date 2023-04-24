//
//  TaskView.swift
//  ToDoDemo
//
//  Created by JSNPC-0041 on 2022/11/26.
//

import Foundation
import SwiftUI


struct TaskView: View {
    @EnvironmentObject var realmManeger: RealmManager
    
    var body: some View {
        VStack{
            Text("My tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth:.infinity,alignment: .leading)
            
            List{
                ForEach(realmManeger.tasks,id: \.id){
                    task in
                    if !task.isInvalidated{
                        TaskRow(task:task.title,completed: task.completed)
                            .onTapGesture {
                                realmManeger.updateTask(id: task.id, completed:!task.completed)
                            }
                            .swipeActions(edge:.trailing){
                                Button(role:.destructive){
                                    realmManeger.deleteTask(id: task.id)
                                }label: {
                                    Label("Delete",systemImage: "trash")
                                }
                            }
                    }
    
                }
                .listRowSeparator(.hidden)
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}
struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
