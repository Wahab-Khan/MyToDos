//
//  ToDoFormView.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/18/21.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var dataStore : DataStore
    @ObservedObject var toDoForm: ToDoFormViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
                VStack(alignment: .leading){
                    TextField("Todo", text: $toDoForm.name)
                    Toggle("Completed", isOn: $toDoForm.complete)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton,
                               trailing: updateSaveButton)
        }
    }
}


extension ToDoFormView {
    func updateToDo(){
        let toDo = ToDo(id: toDoForm.id!, name: toDoForm.name, complete: toDoForm.complete)
        dataStore.updateToDo(toDo)
        dismisView()
    }
    
    func addToDo(){
        let toDo = ToDo(name: toDoForm.name)
        dataStore.addToDo(toDo)
        dismisView()
    }
    
    var cancelButton : some View{
        Button("Cancel"){
            dismisView()
        }
    }
    var updateSaveButton: some View{
        Button(toDoForm.update ? "update" : "save"){
             toDoForm.update ? updateToDo() : addToDo()}
            .disabled(toDoForm.isDisable)
    }
    
    
    func dismisView(){
        presentationMode.wrappedValue.dismiss()
    }
}

struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFormView(toDoForm: ToDoFormViewModel())
            .environmentObject(DataStore())
    }
}
