//
//  DeclutteringTasks.swift
//  Less
//
//  Created by Petya Kantarska on 8.08.23.
//

import Foundation
import FirebaseFirestoreSwift

class DeclutteringTasks: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var note: String
    var isCompleted = false
    
    init(id: String? = nil, name: String, note: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.note = note
        self.isCompleted = isCompleted
    }
}
