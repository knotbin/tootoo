//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var sheetIsShown = false
    
    private let uid: String
    
    init(userid: String) {
        uid = userid
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
         
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(id)
            .delete()
    }
}
