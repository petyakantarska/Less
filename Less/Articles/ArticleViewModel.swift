//
//  ArticleViewModel.swift
//  Less
//
//  Created by Petya Kantarska on 13.09.23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []

    private var db = Firestore.firestore()

    func fetchArticles() {
        db.collection("articles").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching articles: \(error.localizedDescription)")
                return
            }
            
            if let documents = querySnapshot?.documents {
                self.articles = documents.compactMap { document in
                    do {
                        return try document.data(as: Article.self)
                    } catch {
                        print("Error decoding article: \(error.localizedDescription)")
                        return nil
                    }
                }
            }
        }
    }
}

