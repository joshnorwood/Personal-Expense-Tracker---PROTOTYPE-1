//
//  User.swift
//  Personal Expense Tracker - PROTOTYPE
//
//  Created by Joshua Norwood on 4/12/23.
//

import Foundation

class User : Codable {
    var userID: Int
    var email: String
    var password: String
    var occupation: String
    var salary: Double
    var expenses: [String]

    init(userID: Int, email: String, password: String, occupation: String = "", salary: Double = 0.0, expenses: [String] = []) {
        self.userID = userID
        self.email = email
        self.password = password
        self.occupation = occupation
        self.salary = salary
        self.expenses = expenses
    }
}

