//
//  AuthViewModel.swift
//  Less
//
//  Created by Petya Kantarska on 1.08.23.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseCore

class AuthViewModel: ObservableObject {
    static let shared = AuthViewModel()
    @Published var currentUser: User?
    @Published var isLoggedIn = false
    
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.isLoggedIn = auth.currentUser != nil
        }
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }
            self.currentUser = user
        }
    }
    
    func getCurrentUserUID() -> String? {
        return currentUser?.uid
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self]
            (authResult, error) in
            if error == nil {
                self?.isLoggedIn = true
            } else {
                self?.isLoggedIn = false
                print("Error during login \(error!.localizedDescription)")
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            print("Error during logout \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
}
