//
//  HomeScreen.swift
//  Less
//
//  Created by Petya Kantarska on 1.08.23.
//

import SwiftUI
import Firebase

struct WelcomeScreen: View {
    
    
    @State private var isUserLoggedIn = false
    @ObservedObject var viewModel = AuthViewModel()
    
    
    var body: some View {
        if viewModel.isLoggedIn {
            HomeScreen()
                .environmentObject(viewModel)
        } else {
            LogInScreen()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    WelcomeScreen()
}
