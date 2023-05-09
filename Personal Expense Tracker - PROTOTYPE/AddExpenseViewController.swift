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

    func saveExpense(expense: String, amount: Double) {
        var expenses = UserDefaults.standard.dictionary(forKey: "expenses") as? [String: Double] ?? [:]
        expenses[expense] = amount
        UserDefaults.standard.set(expenses, forKey: "expenses")
    }

    func loadExpenses() -> [String] {
        let expenses = UserDefaults.standard.dictionary(forKey: "expenses") as? [String: Double] ?? [:]
        return Array(expenses.keys)
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
