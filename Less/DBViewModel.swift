//
//  DBViewModel.swift
//  Less
//
//  Created by Petya Kantarska on 8.08.23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class DBViewModel: ObservableObject {
    var db = Firestore.firestore()
    
    @Published var tasks: [DeclutteringTasks] = []
    
    init() {
        addDefaultTasks()
    }
    
    func addDefaultTasks() {
        let defaultTasks: [DeclutteringTasks] = [
            DeclutteringTasks(name: "Clothing", note: "1", isCompleted: false)
        ]
        tasks.append(contentsOf: defaultTasks)
        
        print("Default tasks added: \(defaultTasks)")
    }
    
    func fetchData() {
        db.collection("tasks").order(by: "timestamp", descending: false).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.tasks = documents.compactMap({ document in
                try? document.data(as: DeclutteringTasks.self)
            })
        }
    }
    
    func addTask(_ task: DeclutteringTasks) {
        do {
            _ = try db.collection("tasks").addDocument(data: [
                "id": task.id,
                "name": task.name,
                "note": task.note,
                "isCompleted": false,
                "timestamp": Date()
            ] as! [String: Any])
        } catch {
            print("Error adding task: \(error.localizedDescription)")
        }
    }
    
    func update(_ task: DeclutteringTasks) {
        guard let id = task.id else { return }
        
        db.collection("tasks").document(id).setData([
            "isCompleted": task.isCompleted,
            "title": task.name,
            "note": task.note
        ])
    }
    
        func deleteTask(_ task: DeclutteringTasks) {
            if let taskID = task.id {
                db.collection("tasks").document(taskID).delete()
            }
        }
    
    
    
}
