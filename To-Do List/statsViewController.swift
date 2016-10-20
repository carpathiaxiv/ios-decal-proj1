//
//  statsViewController.swift
//  To-Do List
//
//  Created by Licheng Xu on 10/18/16.
//  Copyright © 2016 Licheng Xu. All rights reserved.
//

import UIKit

class statsViewController: UIViewController {
 
    @IBOutlet var completedCount: UILabel!

    override func viewDidLoad() {
        let sum = completed_list.reduce(0, +)
        completedCount.text=String(sum)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
