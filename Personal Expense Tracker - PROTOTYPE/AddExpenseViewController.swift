//
//  AddExpenseViewController.swift
//  Personal Expense Tracker - PROTOTYPE
//
//  Created by Joshua Norwood on 5/9/23.
//

import UIKit

class AddExpenseViewController: UIViewController {
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previousExpensesPicker.dataSource = self
        previousExpensesPicker.delegate = self
        
    }
    
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBAction func saveExpenseButtonTapped(_ sender: UIButton) {
        let expense = expenseTextField.text ?? ""
        let amount = Double(amountTextField.text ?? "") ?? 0.0
        saveExpense(expense: expense, amount: amount)
        
        let alertController = UIAlertController(title: "Expense Saved", message: "The Expense Has Been Saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var previousExpensesPicker: UIPickerView!
    
    func saveExpense(_ expense: String) {
        guard let userId = currentUser?.userID else { return }
        let key = "expenses_\(userId)"
        var expenses = UserDefaults.standard.stringArray(forKey: key) ?? []
        expenses.append(expense)
        UserDefaults.standard.set(expenses, forKey: key)
    }
    
    func loadExpenses() -> [String] {
        guard let userId = currentUser?.userID else { return [] }
        let key = "expenses_\(userId)"
        return UserDefaults.standard.stringArray(forKey: key) ?? []
    }
}

extension AddExpenseViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return loadExpenses().count
    }
    
    // UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return loadExpenses()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let expenses = loadExpenses()
        if !expenses.isEmpty {
            let selectedExpense = expenses[row]
            expenseTextField.text = selectedExpense
        }
    }
}
