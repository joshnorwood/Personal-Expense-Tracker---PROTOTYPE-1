//
//  AddIncomeViewController.swift
//  Personal Expense Tracker - PROTOTYPE
//
//  Created by Joshua Norwood on 5/9/23.
//

import UIKit

class AddIncomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!

    @IBAction func saveIncome(_ sender: UIButton) {
        let occupation = occupationTextField.text ?? ""
        let salary = Double(salaryTextField.text ?? "") ?? 0.0
        saveIncome(occupation: occupation, salary: salary)
        
        let alertController = UIAlertController(title: "Income Saved", message: "The Income Has Been Saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func saveIncome(occupation: String, salary: Double) {
        UserDefaults.standard.set(occupation, forKey: "occupation")
        UserDefaults.standard.set(salary, forKey: "salary")
    }
}
