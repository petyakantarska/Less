//
//  AddTaskView.swift
//  Less
//
//  Created by Petya Kantarska on 10.08.23.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var db: DBViewModel
    
    @State var title: String = ""
    @State var note: String = ""
    
    var onDismiss: () -> Void
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
            TextField("Note", text: $note)
                .padding()
            Button(action: {
                db.addTask(DeclutteringTasks(name: title, note: note))
                onDismiss()
            }, label: {
                Text("Add new item")
            })
        }
       
    }
}
