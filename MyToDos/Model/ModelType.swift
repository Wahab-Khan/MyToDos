//
//  ModelType.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/19/21.
//

//import Foundation
import SwiftUI


enum ModelType : Identifiable , View {
    case new
    case update(ToDo)
    
    var id : String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View{
        switch self {
        case .new:
            return ToDoFormView(toDoForm: ToDoFormViewModel())
        case .update(let toDo):
            return ToDoFormView(toDoForm: ToDoFormViewModel(toDo))
        }
    }
    
}
