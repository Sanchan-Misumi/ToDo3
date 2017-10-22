//
//  ViewController.swift
//  ToDo3
//
//  Created by Maho Misumi on 2017/10/17.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    //todoItemという変数を、String型の配列とします
    var todoItem = [String]()
     let saveDate : UserDefaults = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            print("\(todoItem[indexPath.row])が選ばれました")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                saveDate.set(UITableView(), forKey: "todo")
//        if editingStyle == UITableViewCellEditingStyle.delete{
//            todoItem.remove(at: indexPath.row)
//            UserDefaults.standard.set(todoItem, forKey: "todo")
//            todoItemView.reloadData()
//        }
    }
    
    //todoItemViewをUITableViewとしてstoryboardに置きます
    @IBOutlet  var todoItemView: UITableView!
   
    //最初に立ち上がった時の指示を書きます
    override func viewDidLoad() {
        super.viewDidLoad()
        //dataSourceは自分自身（textfielに書いた値です？）
            todoItemView.dataSource = self
        //delegateは自分自身（textfielに書いた値の処理です？）
            todoItemView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todo") as! [String]
    }
    

    

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todo")
        }

//    テーブル（リスト）を下に引っ張って更新機能を記述します。
        func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = (UserDefaults.standard.object(forKey: "todo") as? [String]!)!
        }
        todoItemView.reloadData()
    }
//UserDefaultsの値が代入されている変数todoItemが保持している文字列の数をカウントします。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }

        // Do any additional setup after loading the view, typically from a nib.
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //ID付きのセルを取得して、セル付属のtextLabelに表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoItemView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = todoItem[indexPath.row]
        return cell!
    }
}
}
}

