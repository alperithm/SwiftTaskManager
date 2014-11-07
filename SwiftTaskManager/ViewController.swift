//
//  ViewController.swift
//  SwiftTaskManager
//
//  Created by ALPEN on 2014/11/07.
//  Copyright (c) 2014年 alperithm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTextField: UITextField!
    
    // セルに表示するテキスト
    var texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableViewデリゲートメソッド利用準備
        tableView.delegate = self
        tableView.dataSource = self
        
        // TextFieldデリゲートメソッド利用準備
        addTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    *   TableViewデリゲートメソッド
    */
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    // セルの内容を更新
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel.text = texts[indexPath.row]
        // Standard options
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        //cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        //cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        //cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        return cell
    }
    
    // セルの選択時の動作
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(String(format: "touch %d !", indexPath.row))
    }
    
    // セルの消去
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            texts.removeAtIndex(indexPath.row)
            tableView.reloadData();
        }
    }
    
    // セルを追加する
    @IBAction func addTableCellButton(sender: AnyObject) {
        if !addTextField.text.isEmpty {
            texts.append(addTextField.text)
            tableView.reloadData()
            addTextField.text = String()
        }
    }
    
    /**
    *   TextFieldデリゲートメソッド
    */
    
    // テキストフィールド入力終了後キーボードを閉じる
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

