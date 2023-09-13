//
//  LessApp.swift
//  Less
//
//  Created by Petya Kantarska on 1.08.23.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Firestore.firestore()
        return true
    }
}

@main
struct LessApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
        }
    }
}
