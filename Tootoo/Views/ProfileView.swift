//
//  ProfileView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    VStack(alignment: .center) {
                        Text(user.name)
                            .bold()
                            .font(.system(size: 22))
                            .padding()
                        HStack {
                            Text("Email")
                                .bold()
                            Text (user.email)
                        }
                        HStack {
                            Text("Member since")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                        }
                        Button() {
                            viewModel.signOut()
                        } label: {
                            Text("Sign Out")
                                .bold()
                        }
                        .tint(Color.red)
                        .padding()
                    }
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Account")
        }
        .onAppear {
                viewModel.fetchUser()
            }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
