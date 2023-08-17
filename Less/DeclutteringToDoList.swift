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
        Spacer()
        NavigationView {
            List {
                ForEach(db.tasks, id: \.id) { task in
                    VStack {
                        HStack {
                            TaskRow(task: task) { updatedTask in
                                updatedTask.isCompleted = !updatedTask.isCompleted
                                db.update(updatedTask)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                NavigationLink(destination: {
                                    EditTaskView(task: task, onUpdate: { task in
                                        db.update(task)
                                    }) {
                                        // TODO: on dismiss
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
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                        NavigationLink(destination: MinimalismChallengeView()) {
                            Text("Challenge")
                        }
                        NavigationLink(destination: AboutMinimalismView()) {
                            Text("About minimalism")
                        }
                    }

                }
            }
        }
        .navigationBarItems(trailing:
            Button("Add") {
                isCreateTaskSheetVisible = true
            })
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
                    Text("")
                    
                }
            }
            
            VStack {
                Text(task.name)
                Text(task.note)
            }
        }
    }
}

