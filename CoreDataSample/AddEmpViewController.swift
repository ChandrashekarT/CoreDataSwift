//
//  AddEmpViewController.swift
//  CoreDataSample
//
//  Created by Epos Admin on 18/05/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit
import CoreData

class AddEmpViewController: UIViewController {
    
    @IBOutlet weak var empName : UITextField!
    @IBOutlet weak var empPhoneNo : UITextField!
    @IBOutlet weak var empRole : UITextField!
    @IBOutlet weak var saveUpdate : UIButton!
    var isShowEmp : String!
    
    var appDelegate:AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.saveUpdate.layer.cornerRadius = 10.0
        self.saveUpdate.clipsToBounds = true
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if isShowEmp == "YES"
        {
            self.saveUpdate.setTitle("Upade", for: .normal)
            isShowEmp = "NO"
            empName.text = "Chandu"
            empPhoneNo.text = "9874563219"
            empRole.text = "iOS Developer"
        }
        else
        {
            self.saveUpdate.setTitle("Save", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        empName.resignFirstResponder()
        empPhoneNo.resignFirstResponder()
        empRole.resignFirstResponder()
    }
    
    @IBAction func saveUpdateClicked()
    {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Epos", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(empName.text, forKey: "emp_name")
        newUser.setValue(empPhoneNo.text, forKey: "emp_phoneNo")
        newUser.setValue(empRole.text, forKey: "emp_role")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        self.navigationController?.popViewController(animated: true)
    }

}
