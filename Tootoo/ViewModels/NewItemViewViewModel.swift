//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var due = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        //get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newID = UUID().uuidString
        let newItem = ToDoItem(id: newID, title: name, dueDate: due.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        //save model to database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard due >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
