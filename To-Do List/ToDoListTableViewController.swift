//
//  TodoTableViewController.swift
//  To-Do List
//
//  Created by Licheng Xu on 10/15/16.
//  Copyright © 2016 Licheng Xu. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController{

//    @IBOutlet var mySwitch: UISwitch!

    var completed_items=[String]()
    
    let time_to_kill=24.0*60*60
    
    var timer:Timer?
    func fireTimer(){
        for elem in times{
                let elapsed = Date().timeIntervalSince(elem as Date)
                let index=times.index(of: elem)
                let temp=taskList[index!]
                if (elapsed>=self.time_to_kill && self.completed_items.contains(temp)){
                    completed_list.remove(at:index!)
                    times.remove(at:index!)
                    taskList.remove(at: index!)
                    }
            
        }
        self.tableView.reloadData()
    }
    
    @IBOutlet var mytableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        timer=Timer.scheduledTimer(timeInterval: time_to_kill, target:self, selector:#selector(TodoTableViewController.fireTimer), userInfo:nil,repeats:true )

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("reload Data")
        mytableView.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print (taskList.count)
        return taskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print ("never called**************")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! myTableViewCell

        // Configure the cell...
//         cell.textLabel?.text=taskList[indexPath.row]
        cell.cellName.text=taskList[indexPath.row]
        
        print ("here")
        print (cell.textLabel?.text)
        if completed_items.contains(cell.cellName.text!){
            
        }else{
            print ("set on")
            cell.mySwitch.setOn(true, animated: true)
        }
        
        cell.callback = {(cell: myTableViewCell) -> () in
//            let i = tableView.indexPath(for: cell)
            if cell.mySwitch.isOn{
                completed-=1
            }else{
                completed+=1
                completed_list[indexPath.row]=1
                times[indexPath.row]=NSDate()
                self.completed_items.append(taskList[indexPath.row])
            }
            
            print("completed: ")
            print (completed)
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            print ("index path:")
            print (indexPath)
            completed_list.remove(at:indexPath[1])
            print (completed_list)
            times.remove(at:indexPath[1])
            taskList.remove(at: indexPath[1])
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //self.dismissViewController() //go back to todos view
        print ("****segue pressed****")
        print (segue)
    }
    

}
