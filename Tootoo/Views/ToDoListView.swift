//
//  ToDoItemsView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userid: String
    
    init(userid: String) {
        self.userid = userid
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userid: "")
    }
}
