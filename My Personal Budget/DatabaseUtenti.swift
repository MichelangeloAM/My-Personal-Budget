//
//  DatabaseUtenti.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 16/04/23.
//

import Foundation
import Firebase


final class DatabaseAPI {
    static let shared = DatabaseAPI()
    private let database = Database.database(url: "https://console.firebase.google.com/u/0/project/my-personal-budget-82e61/database/my-personal-budget-82e61-default-rtdb/data/~2F").reference()
}


struct User {
    let email   : String
    let password: String
}

extension DatabaseAPI {
    
}
