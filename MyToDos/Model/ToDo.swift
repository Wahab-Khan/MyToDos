//
//  ToDo.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/18/21.
//

import Foundation

struct ToDo : Identifiable , Codable {
    var id : String = UUID().uuidString
    var name : String
    var complete : Bool = false
    
//    static var sampleData : [ToDo] = [
//        ToDo(name: "By mini"),
//        ToDo(name: "Mac M1X", complete: false),
//        ToDo(name: "SwiftUI", complete: true)
//    ]
}
