//
//  RegistrationViewController.swift
//  TodoApp
//
//  Created by David Winnicki on 2017-06-22.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import UIKit

protocol RegistrationDelegate {
    func getUserName(username: String)
}

class RegistrationViewController: UIViewController {

    var delegate: RegistrationDelegate?
    
    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        let username: String = txtFieldUsername.text!
        let password: String = txtFieldPassword.text!
        
        RegistrationManager.register(
            userName: username,
            password: password) {
                (responseData, error) in
                if let response = responseData {
                    if response.success == "true" {
                        print(response)
                        self.delegate?.getUserName(username: username)
                        self.navigationController?.popViewController(animated: true)
                    } else {
                        print(response.message)
                        let alert = UIAlertController(title: "Error", message: response.message, preferredStyle: .alert)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
