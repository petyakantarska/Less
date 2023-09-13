//
//  SignUpScreen.swift
//  Less
//
//  Created by Petya Kantarska on 1.08.23.
//

import SwiftUI

struct SignUpScreen: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var showingAlert = false
    
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
                    viewModel.createUser(email: email, password: password)
                }) {
                    Text("Sign up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.4))
                        .cornerRadius(10)
                }
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Sign up is successful"),
            message: Text("Your account has been created."),
                  dismissButton: .default(Text("OK")))
        })
        .padding(.vertical, 20)
        .padding(.horizontal, 40)
    }
}

#Preview {
    SignUpScreen()
}
