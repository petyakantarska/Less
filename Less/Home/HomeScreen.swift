//
//  WelcomeScreen.swift
//  Less
//
//  Created by Petya Kantarska on 1.08.23.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var db = DBViewModel()
    
    var body: some View {
        TabView {
            DeclutteringToDoList()
                .tabItem {
                    VStack {
                        Image(systemName: "checkmark.square")
                        Text("Tasks")
                    }
                }
            
            MinimalismChallengeView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.star")
                        Text("Challenge")
                    }
                }
            
            AboutMinimalismView()
                .tabItem {
                    VStack {
                        Image(systemName: "books.vertical")
                        Text("Articles")
                    }
                }
            
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
        }
        .accentColor(Color.brown.opacity(1.0))
    }
}
