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

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!

    @IBAction func saveIncome(_ sender: UIButton) {
        let occupation = occupationTextField.text ?? ""
        let salary = Double(salaryTextField.text ?? "") ?? 0.0
        
        // Save income data using UserDefaults or another storage method
    }

    

    

}
