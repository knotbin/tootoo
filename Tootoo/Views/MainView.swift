//
//  ContentView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userid: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Account", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
