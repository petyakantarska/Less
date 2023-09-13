//
//  DeclutteringTasks.swift
//  Less
//
//  Created by Petya Kantarska on 8.08.23.
//

import Foundation
import FirebaseFirestoreSwift

class DeclutteringTasks: Identifiable, Codable {
    var id: String?
    var name: String
    var note: String
    var isCompleted = false
    var ownerID: String
    var timestamp: Date
    
    init(id: String? = nil, name: String, note: String, isCompleted: Bool = false, ownerID: String, timestamp: Date = Date()) {
        self.id = id
        self.name = name
        self.note = note
        self.isCompleted = isCompleted
        self.ownerID = ownerID
        self.timestamp = timestamp
    }
}
