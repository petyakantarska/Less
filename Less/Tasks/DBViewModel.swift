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
    let authViewModel = AuthViewModel.shared
    
    
    var db = Firestore.firestore()
    
    @Published var tasks: [DeclutteringTasks] = []
    
    func fetchData() {
        guard let ownerID = authViewModel.currentUser?.uid else { return }
        
        db.collection("tasks")
            .whereField("ownerID", isEqualTo: ownerID)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.tasks = documents.compactMap({ document in
                    let data = document.data()
                    return DeclutteringTasks(
                        id: document.documentID,
                        name: data["name"] as! String,
                        note: data["note"] as! String,
                        isCompleted: data["isCompleted"] as! Bool,
                        ownerID: data["ownerID"] as! String,
                        timestamp: (data["timestamp"] as? ServerTimestamp<Date>)?.wrappedValue ?? Date()
                    )
                })
            }
    }
    
    func addTask(_ task: DeclutteringTasks) {
        guard let ownerID = authViewModel.getCurrentUserUID() else { return }
        
        _ = db.collection("tasks").addDocument(data: [
                "name": task.name,
                "note": task.note,
                "isCompleted": false,
                "ownerID": ownerID,
                "timestamp": Date()
            ] as! [String: Any])
        
    }
    
    func update(_ task: DeclutteringTasks) {
        guard let id = task.id else { return }
        
        db.collection("tasks").document(id).updateData([
            "isCompleted": task.isCompleted,
            "name": task.name,
            "note": task.note,
            "timestamp": Date()
        ])
    }
    
        func deleteTask(_ task: DeclutteringTasks) {
            if let taskID = task.id {
                db.collection("tasks").document(taskID).delete()
            }
        }
    
    
    
}
