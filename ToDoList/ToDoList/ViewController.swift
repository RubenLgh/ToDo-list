//
//  ViewController.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 03/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath) as! TableViewCell
        let row = indexPath.row
        cell.titre.text = taches[row].nom
        cell.desc.text = taches[row].desc
        
        return cell
    }
    

    var taches = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taches = [ToDo(nom :"Faire les courses",desc: "aliment 1, aliment 2"),ToDo(nom :"Faire les courses",desc: "aliment 1, aliment 2"),ToDo(nom :"Faire les courses",desc: "aliment 1, aliment 2")]
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "afficherDetail"{
            let destination = segue.destination as! DescViewController
            let indexPath = tableView.indexPathForSelectedRow
            let row = indexPath?.row
            destination.todo = taches[row!]
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            taches.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func ajouterTache(unwindSegue: UIStoryboardSegue) {
        if let destination = unwindSegue.source as? NouvelleTacheViewController{
            taches.append(ToDo(nom : destination.nom.text!, desc: destination.desc.text!))
            tableView.reloadData() 
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
}

