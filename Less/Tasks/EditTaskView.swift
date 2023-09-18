//
//  EditTaskView.swift
//  Less
//
//  Created by Petya Kantarska on 11.08.23.
//

import SwiftUI

struct EditTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var task: DeclutteringTasks
    
    @State var title: String = ""
    @State var note: String = ""
    
    var onUpdate: (_ task: DeclutteringTasks) -> Void
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
                task.name = title
                task.note = note
                onUpdate(task)
                dismiss()
            }, label: {
                Text("Edit task")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown.opacity(0.4))
                    .cornerRadius(10)
            })
        }
    }
}

