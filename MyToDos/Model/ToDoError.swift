//
//  ToDoError.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/20/21.
//

import Foundation

enum TodoError : Error , LocalizedError {
    case saveError
    case readError
    case encodingError
    case decodingError
    
    var errorDescription: String?{
        switch self {
        case .saveError:
            return NSLocalizedString("Could not save ToDos. Please reinstall app", comment: "")
        case .readError:
            return NSLocalizedString("Could not read ToDos. Please reinstall app", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save ToDos. Please reinstall app", comment: "")
        case .decodingError:
            return NSLocalizedString("There is a problum, please try again", comment: "")
        }
    }
}


struct ErrorType : Identifiable{
    var id = UUID()
    var error : TodoError
}
