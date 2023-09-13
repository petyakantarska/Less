//
//  Article.swift
//  Less
//
//  Created by Petya Kantarska on 13.09.23.
//

import Foundation

struct Article: Codable, Identifiable {
    var id: String
    var title: String
    var content: String
}
