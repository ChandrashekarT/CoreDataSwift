//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Epos Admin on 18/05/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var employeeTableView : UITableView!
    
    var employees: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Epos")
        //3
        do {
            employees = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        self.reloadEmployeeTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: -- UITableView Datasource & Delegate Methods
    func reloadEmployeeTableView() {
        employeeTableView.delegate = self
        employeeTableView.dataSource = self
        employeeTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return employees.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 107
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmpCell") as! EmployeeCell
        
        let employee = employees[indexPath.row]
        
        cell.empName.text = String.init(format: "%@",employee.value(forKey: "emp_name") as! CVarArg)
        cell.empPhoneNo.text = String.init(format: "%@",employee.value(forKey: "emp_phoneNo") as! CVarArg)
        cell.empRole.text = String.init(format: "%@",employee.value(forKey: "emp_role") as! CVarArg)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let showEmpVC = storyboard?.instantiateViewController(withIdentifier: "AddEmpViewController") as! AddEmpViewController
        showEmpVC.isShowEmp = "YES"
        self.navigationController?.pushViewController(showEmpVC, animated: true)
    }
}

