//
//  TodoDetailViewController.swift
//  2016-06-01-codelab-frontend
//
//  Created by Fatih Nayebi on 2016-06-01.
//  Copyright © 2016 Swift-Mtl. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    var model = TodoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func save(_ sender: Any) {
        let name = nameField.text
        let detail = detailField.text
        let done = doneSwitch.isOn
        
        model.name = name!
        model.details = detail!
        model.completed = done
        
        TodoManager.addTodo {(model) in
            print(0)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
