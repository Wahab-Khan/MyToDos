//
//  ToDoFormViewModel.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/18/21.
//

import Foundation


class ToDoFormViewModel: ObservableObject {
    @Published var name : String = ""
    @Published var complete : Bool = false
    var id : String?
    
    
    var update : Bool {
        id != nil
    }
    
    var isDisable : Bool{
        name.isEmpty
    }
    
    
    init() {}
    
    init(_ currentToDo : ToDo) {
        self.name = currentToDo.name
        self.complete = currentToDo.complete
        self.id = currentToDo.id
    }
    
}
