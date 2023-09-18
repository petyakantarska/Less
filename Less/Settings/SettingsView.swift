//
//  SettingsView.swift
//  Less
//
//  Created by Petya Kantarska on 13.09.23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var db = DBViewModel()
    
    @State private var notificationsEnabled = UserDefaults.standard.bool(forKey: "NotificationsEnabled")
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                        .onChange(of: notificationsEnabled) { newValue in
                            UserDefaults.standard.set(newValue, forKey: "NotificationsEnabled")
                        }
                }
                
                Section(header: Text("Preferences")) {
                    Button(action: {
                        resetSettings()
                    }, label: {
                        Text("Reset Settings")
                            .foregroundColor(.red)
                            //.padding()
                            //.background(Color.red.opacity(0.8))
                            //.cornerRadius(10)
                    })
                }
                
                Section(header: Text("About")) {
                                    Text("App Name: Less")
                                        .font(.subheadline)
                                    Text("Developer: Petya Kantarska")
                                        .font(.subheadline)
                                    Text("Description: Mobile iOS app for decluttering and minimalistic living.")
                                        .font(.caption2)
                                }
                
                Section(header: Text("Account")) {
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Log out")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.brown.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
            }
            .navigationTitle("⚙️ Settings")
                        .foregroundColor(Color.brown.opacity(1.0))
        }
    }
    func resetSettings() {
            UserDefaults.standard.removeObject(forKey: "NotificationsEnabled")
            notificationsEnabled = false
        }
    
}


