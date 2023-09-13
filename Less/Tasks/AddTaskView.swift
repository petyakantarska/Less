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
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack{
                    VStack {
                        Spacer(minLength: 20)
                        HStack(alignment: .bottom, spacing: 16) {
                                NavigationLink(destination: MinimalismChallengeView()) {
                                    VStack {
                                        Image(systemName: "list.star")
                                            .font(.subheadline)
                                            .frame(width: 25, height: 25)
                                            .padding(10)
                                            .background(Color.brown.opacity(0.5))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                        Text("Challenge")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                NavigationLink(destination: AboutMinimalismView()) {
                                    VStack {
                                        Image(systemName: "books.vertical")
                                            .font(.subheadline)
                                            .frame(width: 25, height: 25)
                                            .padding(10)
                                            .background(Color.brown.opacity(0.5))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                        Text("Articles")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    
                                }
                                NavigationLink(destination: SettingsView()) {
                                    VStack {
                                        Image(systemName: "gear")
                                            .font(.subheadline)
                                            .frame(width: 25, height: 25)
                                            .padding(10)
                                            .background(Color.brown.opacity(0.5))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                        Text("Settings")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                        }
                    }
                }

            }
        }
       
    }
}
