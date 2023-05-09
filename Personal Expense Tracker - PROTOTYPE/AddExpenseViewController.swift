//
//  AddExpenseViewController.swift
//  Personal Expense Tracker - PROTOTYPE
//
//  Created by Joshua Norwood on 5/9/23.
//

import UIKit

class AddExpenseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        previousExpensesPicker.dataSource = self
        previousExpensesPicker.delegate = self
        
    }
    
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!

    @IBAction func saveExpense(_ sender: UIButton) {
        let expense = expenseTextField.text ?? ""
        let amount = Double(amountTextField.text ?? "") ?? 0.0
        
        // Save expense data using UserDefaults or another storage method
    }
    
    @IBOutlet weak var previousExpensesPicker: UIPickerView!

    func saveExpense(_ expense: String) {
        var expenses = UserDefaults.standard.stringArray(forKey: "expenses") ?? []
        expenses.append(expense)
        UserDefaults.standard.set(expenses, forKey: "expenses")
    }

    func loadExpenses() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "expenses") ?? []
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
        let selectedExpense = loadExpenses()[row]
        expenseTextField.text = selectedExpense
    }
}
