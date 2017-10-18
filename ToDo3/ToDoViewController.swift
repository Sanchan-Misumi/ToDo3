//
//  ToDoViewController.swift
//  ToDo3
//
//  Created by Maho Misumi on 2017/10/17.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit


class ToDoViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var todoTextField: UITextField!
    let saveDate : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTextField.text = saveDate.object(forKey: "todo") as? String
        todoTextField.delegate = self
    }

    @IBAction func add(_ sender: UIButton) {
        saveDate.set(todoTextField, forKey: "todo")
        saveDate.synchronize()
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.default,
                handler: { action in
                    
                    self.navigationController!.popViewController(animated: true)
        }
        )
        )
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func `return`(_ sender: UIBarButtonItem) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
