//
//  EditViewController.swift
//  ToDo3
//
//  Created by Maho Misumi on 2017/10/22.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var todoItem = [String]()
    @IBOutlet var todoTextField: UITextField!
    let saveDate : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTextField.text = saveDate.object(forKey: "todo") as? String
        todoTextField.delegate = self as? UITextFieldDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func edit(){
        todoItem.append(todoTextField.text!)
        saveDate.set(todoItem, forKey: "todo")
        saveDate.synchronize()
    }

    @IBAction func back(){
                self.dismiss(animated: true, completion: nil)
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
