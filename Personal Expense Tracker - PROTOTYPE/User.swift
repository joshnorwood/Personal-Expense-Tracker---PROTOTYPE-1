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
    var totalIncome: Double
    var totalExpenses: Double
    
    init(userID: Int, email: String, password: String, totalIncome: Double, totalExpenses: Double) {
        self.userID = userID
        self.email = email
        self.password = password
        self.totalIncome = totalIncome
        self.totalExpenses = totalExpenses
    }
}
