//
//  ToDoViewController.swift
//  ToDo3
//
//  Created by Maho Misumi on 2017/10/17.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource {
    
    //ToDoを入れるための配列
    var todoItem = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をToDoArrayの要素の数にする
        return todoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    @IBOutlet var todoTextField: UITextField!
    
    let saveDate : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTextField.text = saveDate.object(forKey: "todo") as? String
        todoTextField.delegate = self
    }

    @IBAction func add(_ sender: UIButton) {
        todoItem.append(todoTextField.text!)
        saveDate.set(todoItem, forKey: "todo")
        saveDate.synchronize()
        
        let storyboard: UIStoryboard = self.storyboard!
        let firstView = storyboard.instantiateViewController(withIdentifier: "first") as! ViewController
        self.present(firstView, animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true, completion: nil)
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
