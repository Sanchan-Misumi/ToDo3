//
//  ViewController.swift
//  ToDo3
//
//  Created by Maho Misumi on 2017/10/17.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var todoItemView: UITableView!
    var todoItem = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = (UserDefaults.standard.object(forKey: "todo") as? [String])!
            todoItemView.dataSource = self
            todoItemView.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(todoItem[indexPath.row])が選ばれました")
    }
//cellをEdit(編集)したい場合に使用する関数
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todo")
            todoItemView.reloadData()
        }
    }
//    テーブル（リスト）を下に引っ張って更新機能を記述します。
    override func viewDidAppear(_ animated: Bool) {
        todoItemView.reloadData()
    }
//UserDefaultsの値が代入されている変数todoItemが保持している文字列の数をカウントします。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }

        // Do any additional setup after loading the view, typically from a nib.
    override func didReceiveMemoryWarning() {
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

