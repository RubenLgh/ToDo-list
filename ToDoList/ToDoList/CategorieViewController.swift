//
//  CategorieViewController.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 15/12/2021.
//

import UIKit

class CategorieViewController: UIViewController , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath) as! CategorieTableViewCell
        let row = indexPath.row
        
        cell.categorie.text = categories[row].nomCategorie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    var categories = [ToDoList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        categories = [ToDoList(nom : "Travail"), ToDoList(nom : "Personnel"),ToDoList(nom : "Famille")]
        categories[0].liste.append(ToDo(nom : "travailler", desc: "tous les cours", date: Date()))
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "afficherCategorie"{
            let destination = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow
            let row = indexPath?.row
            destination.taches = categories[row!].liste
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func retourListeCategories(unwindSegue: UIStoryboardSegue) {
        if let destination = unwindSegue.source as? ViewController{
            let indexPath = tableView.indexPathForSelectedRow
            categories[indexPath!.row].liste = destination.taches
            tableView.reloadData()
        }
        if let destination = unwindSegue.source as? NouvelleCategorieViewController{
            categories.append(ToDoList(nom : destination.nom.text!))
            tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            categories.remove(at: indexPath.row)
            tableView.reloadData()
        }
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
