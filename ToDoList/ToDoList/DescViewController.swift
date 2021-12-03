//
//  DescViewController.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 03/12/2021.
//

import UIKit

class DescViewController: UIViewController {

    var todo: ToDo?
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        desc.text = todo?.desc
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
