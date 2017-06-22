//
//  LoginViewController.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2017-06-16.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, RegistrationDelegate {
    
    var username: String?
    
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    @IBAction func btnLogIn(_ sender: UIButton) {
        // LoginManager
        LoginManager.logIn(userName: txtFieldUserName.text!, password: txtFieldPassword.text!) {
            (responseData, error) in
            if let response = responseData {
                if response.success == true {
                    print(response)
                    let todosViewController = self.storyboard?.instantiateViewController(withIdentifier: "TodosTableViewController")
                    self.navigationController?.pushViewController(todosViewController!, animated: true)
                } else {
                    print("User name and password were not correct")
                    let alert = UIAlertController(title: "Error", message: "User name and password were not correct", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            } else if  error == true {
                print("Backend error")
                let alert = UIAlertController(title: "Error", message: "Something went wrong with the backend", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // From RegistrationDelegate
    func getUserName(username: String) {
        print("Username: \(username)")
        self.username = username
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RegistrationViewController {
            destination.delegate = self
        }
    }
}
