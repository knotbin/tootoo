//
//  RegisterView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    @State var name = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Welcome to the club.", bg: .yellow, angle: -15, os: -140)
            
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(title: "Sign Up",
                         bgColor: .green) {
                    //action
                }
            }
            
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
