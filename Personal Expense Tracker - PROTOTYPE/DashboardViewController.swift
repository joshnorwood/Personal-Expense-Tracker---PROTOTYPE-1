//
//  DashboardViewController.swift
//  Personal Expense Tracker - PROTOTYPE
//
//  Created by Joshua Norwood on 4/12/23.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var totalIncomeLabel: UILabel!
    @IBOutlet weak var totalExpensesLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabels()
    }
    
    func updateLabels() {
        guard let currentUser = currentUser else { return }
        totalIncomeLabel.text = "Total Income: \(currentUser.totalIncome)"
        totalExpensesLabel.text = "Total Expenses: \(currentUser.totalExpenses)"
            balanceLabel.text = "Net Income: \(currentUser.totalIncome - currentUser.totalExpenses)"
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let addMenu = UIAlertController(title: nil, message: "Choose an option", preferredStyle: .actionSheet)
        
        let addIncomeAction = UIAlertAction(title: "Add Income", style: .default) { (action) in
            // Segue to AddIncomeViewController
            self.performSegue(withIdentifier: "showAddIncome", sender: self)
        }
        
        let addExpenseAction = UIAlertAction(title: "Add Expense", style: .default) { (action) in
            // Segue to AddExpenseViewController
            self.performSegue(withIdentifier: "showAddExpense", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        addMenu.addAction(addIncomeAction)
        addMenu.addAction(addExpenseAction)
        addMenu.addAction(cancelAction)
        
        present(addMenu, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
}
