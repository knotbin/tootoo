//
//  LoginView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Tootoo", subtitle: "Get it done.", bg: .pink, angle: 15, os: -100)
                
                //Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Log In",
                             bgColor: .blue) {
                        //action
                    }
                }
                
                //Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
