//
//  DataStore.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/18/21.
//

import Foundation


class DataStore: ObservableObject {
    
    @Published var toDos : [ToDo] = []
    @Published var appError : ErrorType? = nil
    
    init() {
        print(FileManager.docDirURL.path)
        if(FileManager().doExist(name: fileName)){
            loadToDo()
        }
    }
    
    func addToDo(_ todo : ToDo){
        toDos.append(todo)
        saveToDo()
    }
    
    
    func updateToDo(_ todo: ToDo){
        guard let index = toDos.firstIndex(where: { $0.id == todo.id }) else { return }
        toDos[index] = todo
        saveToDo()
    }
    
    func deleteToDo(at index: IndexSet){
        toDos.remove(atOffsets: index)
        saveToDo()
    }
    
    func loadToDo(){
        FileManager().readDocument(docName: fileName) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    toDos = try decoder.decode([ToDo].self, from: data)
                } catch {
                    print(TodoError.decodingError.localizedDescription)
                    appError = ErrorType(error: .decodingError)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
//        toDos = ToDo.sampleData
    }
    
    func saveToDo(){
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(toDos)
            let jsonString = String.init(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contant: jsonString, docName: fileName) { error in
                if error != nil{
                    print(TodoError.encodingError.localizedDescription)
                    appError = ErrorType(error: .encodingError)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        print("save in file")
    }
}

