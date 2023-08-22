//
//  NewItemView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 40)
            Form {
                TextField("Task Name", text: $viewModel.name)
                
                DatePicker("Due Date", selection: $viewModel.due)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Add", bgColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        isPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                    .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Please correctly fill all fields"),
                    message: Text("Make sure the name is filled and the due date is today or later")
                )
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(isPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
