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
    @Published var isLoggedIn = false
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.isLoggedIn = auth.currentUser != nil
        }
    }
    
    func login(email: String, password: String) {
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
    
    func logout() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            print("Error during logout \(error.localizedDescription)")
        }
    }
    
    func signup(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
}
