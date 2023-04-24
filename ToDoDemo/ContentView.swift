//
//  ContentView.swift
//  ToDoDemo
//
//  Created by JSNPC-0041 on 2022/11/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManeger = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TaskView()
                .environmentObject(realmManeger)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView){
           AddTaskView()
                .environmentObject(realmManeger)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
