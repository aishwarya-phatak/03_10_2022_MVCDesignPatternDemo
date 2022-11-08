//
//  ViewController.swift
//  03_10_2022_MVCDesignPatternDemo
//
//  Created by Vishal Jagtap on 07/11/22.
//

import UIKit

class ViewController: UIViewController{
    
    var employees : [Employee] = []
    
    var secondViewController : SecondViewController = SecondViewController()

    @IBOutlet weak var employeeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        
       let uiNib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
       self.employeeTableView.register(uiNib, forCellReuseIdentifier: "EmployeeTableViewCell")
    }
    
    @IBAction func addNewEmnployee(_ sender: Any) {
         secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.delegateOnSecondViewContoller = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

//MARK : ViewContoller class conformed to UITableViewDataSource protocol
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if(employees != nil)
            return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeTableViewCell = self.employeeTableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        
        let eachEmployee = employees[indexPath.row]
        employeeTableViewCell.empIdLabel.text = String(eachEmployee.empId)
        employeeTableViewCell.empFirstNameLabel.text = eachEmployee.empFirstName
        employeeTableViewCell.empLastNameLabel.text = eachEmployee.empLastName
        employeeTableViewCell.empSalaryLabel.text = String(eachEmployee.empSalary)
        
        return employeeTableViewCell
    }
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}

extension ViewController : BackDataPassingProtocol{
    
    func passingDataToFirstViewController(employee: Employee) {
        let employeeObject = Employee(
            empId: employee.empId,
            empFirstName: employee.empFirstName,
            empLastName: employee.empLastName,
            empSalary: employee.empSalary
        )
        
        employees.append(employeeObject)
        employeeTableView.reloadData()
    }
}
