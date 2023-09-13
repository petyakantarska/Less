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
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 20)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 20)
            
            Button(action: {
                    viewModel.signIn(email: email, password: password)
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.4))
                        .cornerRadius(10)
                }
            
            NavigationLink(destination: SignUpScreen().environmentObject(viewModel)) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                        .underline()
                }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 40)
    }
}

#Preview {
    LogInScreen()
}
