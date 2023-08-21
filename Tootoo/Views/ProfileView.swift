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
                
            }
            .navigationTitle("Account")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
