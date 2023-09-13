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
                            .font(.subheadline)
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color.brown.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("Tasks")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            
            MinimalismChallengeView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.star")
                            .font(.subheadline)
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color.brown.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("Challenge")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            
            AboutMinimalismView()
                .tabItem {
                    VStack {
                        Image(systemName: "books.vertical")
                            .font(.subheadline)
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color.brown.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("Articles")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                            .font(.subheadline)
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color.brown.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("Settings")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}
