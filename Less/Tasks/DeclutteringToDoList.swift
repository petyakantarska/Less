//
//  DeclutteringToDoList.swift
//  Less
//
//  Created by Petya Kantarska on 8.08.23.
//

import SwiftUI

struct DeclutteringToDoList: View {
    @ObservedObject var db = DBViewModel()
    @State private var isCreateTaskSheetVisible = false
    @State private var isChecked = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(db.tasks, id: \.id) { task in
                    VStack {
                        HStack {
                            TaskRow(task: task) { updatedTask in
                                db.update(updatedTask)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                NavigationLink(destination: {
                                    EditTaskView(task: task, onUpdate: { task in
                                        db.update(task)
                                    }) {
                                    }
                                }, label: {
                                    Text("Edit")
                                })
                            }
                            
                        }
                    }
                }
                .onDelete { indexSet in
                    if let index = indexSet.first {
                        db.deleteTask(db.tasks[index])
                    }
                }
            }.onAppear {
                db.fetchData()
            }
            .navigationBarItems(
                trailing: Button(action: {
                    isCreateTaskSheetVisible = true
                }, label: {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.brown.opacity(0.5))
                        .cornerRadius(10)
                })
            )
            .navigationTitle("📦 Decluttering List")
            .multilineTextAlignment(.center)
            .sheet(isPresented: $isCreateTaskSheetVisible) {
                db.fetchData()
                isCreateTaskSheetVisible = false
            } content: {
                AddTaskView() {
                    isCreateTaskSheetVisible = false
                }
                .environmentObject(db)
            }
        }
    }
}

struct TaskRow: View {
    var task: DeclutteringTasks
    var onUpdate: (_ task: DeclutteringTasks) -> Void
    
    var body: some View {
        HStack {
            Button {
                task.isCompleted = !task.isCompleted
                onUpdate(task)
            } label: {
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                        .foregroundColor(task.isCompleted ? .blue : .gray)
//                    Text("")
                    
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(task.name)
                    .font(.subheadline)
//                Text(task.note)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
            }
        }
    }
}

