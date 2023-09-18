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
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 20)
                .autocapitalization(.none)
            TextField("Note", text: $note)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 20)
                .autocapitalization(.none)
            Button(action: {
                db.addTask(DeclutteringTasks(name: title, note: note, ownerID: ""))
                onDismiss()
            }, label: {
                Text("Add new item")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown.opacity(0.4))
                    .cornerRadius(10)
            })
        }
       
    }
}
