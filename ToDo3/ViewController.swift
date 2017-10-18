//
//  ViewController.swift
//  ToDo3
//
//  Created by Maho Misumi on 2017/10/17.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
            }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = todoItem[indexPath.row]
        return cell
    }
    @IBOutlet weak var todoItemView: UITableView!
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
//        if editingStyle == UITableViewCellEditingStyle.Delete{
//            todoItem.removeAtIndex(indexPath.row)
//            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
//            todolistTable.reloadData()
//        }
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todo")
            todoItemView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        todoItemView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }

        // Do any additional setup after loading the view, typically from a nib.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

