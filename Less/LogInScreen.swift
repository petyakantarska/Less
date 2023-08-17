//
//  LogInScreen.swift
//  Less
//
//  Created by Petya Kantarska on 1.08.23.
//

import SwiftUI

struct LogInScreen: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Log In") {
                viewModel.login(email: email, password: password)
            }
            
            NavigationLink("Sign Up") {
                SignUpScreen()
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    LogInScreen()
}
