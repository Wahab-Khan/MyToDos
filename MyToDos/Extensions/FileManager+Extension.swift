//
//  FileManager+Extension.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/19/21.
//

import Foundation

let fileName = "Todos.json"

extension FileManager {
    static var docDirURL : URL {
        Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveDocument(contant: String,docName: String, completion : (TodoError?) -> Void){
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contant.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(.saveError)
        }
    }
    
    
    func readDocument(docName : String , completion : (Result<Data,TodoError>) -> Void){
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(.readError))
        }
    }
    
    func doExist(name DocName: String) -> Bool{
        fileExists(atPath: Self.docDirURL.appendingPathComponent(DocName).path)
    }
    
}
