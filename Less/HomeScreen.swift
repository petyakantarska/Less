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
        VStack {
            Spacer()
            
            DeclutteringToDoList()

            Button(action: {
                viewModel.logout()
            }, label: {
                Text("Log out")
            })
            
        }
    }
}
