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
    
    var body: some View {
        NavigationView {
            VStack {
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
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
