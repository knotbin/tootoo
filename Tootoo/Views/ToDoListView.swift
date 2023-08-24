//
//  ToDoItemsView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoItem]
    
    init(userid: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userid)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userid: userid))
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                            
                        }
                }
                .listStyle(DefaultListStyle())
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    viewModel.sheetIsShown = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .sheet(isPresented: $viewModel.sheetIsShown) {
                    NewItemView(isPresented: $viewModel.sheetIsShown)
                }
            }
            
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userid: "heRFdgGWRmMUUUkJuAqu1vVrdCw2")
    }
}
