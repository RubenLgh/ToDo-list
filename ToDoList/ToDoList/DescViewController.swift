//
//  DescViewController.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 03/12/2021.
//

import UIKit

class DescViewController: UIViewController {

    var todo: ToDo?
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    let affichageDate = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        desc.text = todo?.desc
        titre.text = todo?.nom

        affichageDate.dateStyle = .medium
        affichageDate.timeStyle = .medium
        affichageDate.locale = Locale(identifier: "FR-fr")
        date.text = affichageDate.string(from: todo!.date)

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
