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
    @IBOutlet var todotextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func edit(){
        
    }

    @IBAction func `return`(){
        
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
