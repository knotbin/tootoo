//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var due = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        
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
