//
//  ToDoItemViewViewModel.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleDone(item: ToDoItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
