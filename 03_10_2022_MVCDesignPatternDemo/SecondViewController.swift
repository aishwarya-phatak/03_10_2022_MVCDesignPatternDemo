//
//  SecondViewController.swift
//  03_10_2022_MVCDesignPatternDemo
//
//  Created by Vishal Jagtap on 07/11/22.
//

import UIKit


class SecondViewController: UIViewController {

    @IBOutlet weak var empIdTextField: UITextField!
    @IBOutlet weak var empFirstNameTextField: UITextField!
    @IBOutlet weak var empLastNameTextField: UITextField!
    @IBOutlet weak var empSalary: UITextField!
    
    var delegateOnSecondViewContoller : BackDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func clickBtnToAddEmployeeRecord(_ sender: Any) {
        guard let delegate = delegateOnSecondViewContoller else {
            print("Delegate not Created")
            return
        }
        
        let id = self.empIdTextField.text
        let idInt = Int(id!) ?? 0
        
        let empFirstName = self.empFirstNameTextField.text ?? "Default FN"
        let empLastName = self.empLastNameTextField.text ?? "Default LN"
        
        let empSalary = self.empSalary.text
        let empSalaryFloat = Float(empSalary!) ?? 0.0
        
        /*let empObject = Employee(empId: idInt, empFirstName: empFirstName, empLastName: empLastName, empSalary: empSalaryFloat)*/
        
        delegate.passingDataToFirstViewController(
            employee:
                Employee(empId: idInt,
                         empFirstName: empFirstName,
                         empLastName: empLastName,
                         empSalary: empSalaryFloat))
        
        navigationController?.popViewController(animated: true)
    }

}
