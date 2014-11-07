//
//  ViewController.swift
//  SwiftTaskManager
//
//  Created by ALPEN on 2014/11/07.
//  Copyright (c) 2014年 alperithm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルに表示するテキスト
    var texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    // セルの内容を更新
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel.text = texts[indexPath.row]
        cell.textLabel.textAlignment = NSTextAlignment.Center
        return cell
    }
    
    // セルを追加する
    @IBAction func addTableCellButton(sender: AnyObject) {
        println("add Cell")
        texts.append(String(format: "testCell%02d", texts.count))
        tableView.reloadData()
    }
}

