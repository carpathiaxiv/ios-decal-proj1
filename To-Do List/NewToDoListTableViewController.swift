//
//  NewToDoListTableViewController.swift
//  To-Do List
//
//  Created by Licheng Xu on 10/15/16.
//  Copyright © 2016 Licheng Xu. All rights reserved.
//

import UIKit

var taskList=[String]()
var times=[NSDate]()
var completed=0
var completed_list=[Int]()

class NewToDoListTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBOutlet var task_name: UITextField!
    

    @IBAction func done(_ sender: AnyObject) {
        if task_name.text!.characters.count>0{
            taskList.append(task_name.text!)
            task_name.text=""
            // Get NSDate given the above date components
            let date = Date(timeIntervalSinceReferenceDate: 99999999999)
            completed_list.append(0)
            print (completed_list)
            times.append(date as NSDate)
            self.view.endEditing(true)
            print (taskList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
