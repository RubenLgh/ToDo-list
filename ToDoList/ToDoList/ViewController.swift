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
    let affichageDate = DateFormatter()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath) as! TableViewCell
        let row = indexPath.row
        cell.titre.text = taches[row].nom
        cell.desc.text = taches[row].desc
        
        cell.boutonValider.tag = row
        

        affichageDate.dateStyle = .medium
        affichageDate.timeStyle = .medium
        affichageDate.locale = Locale(identifier: "FR-fr")
        cell.date.text = affichageDate.string(from: taches[row].date)
        
        if(taches[row].valide){
            cell.boutonValider.setTitle("✅", for: .normal)
        }else{
            cell.boutonValider.setTitle("☑️", for: .normal)
        }
        return cell
    }
    
    
    @IBAction func valider(_ sender: UIButton) {
        
        let row = sender.tag
        
        taches[row].valide = !taches[row].valide
        tableView.reloadData()
    }
    

    var taches = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            taches.append(ToDo(nom : destination.nom.text!, desc: destination.desc.text!, date: destination.date.date))
            taches.sort(by: { (e1,e2) -> Bool in return e1.date < e2.date})
            tableView.reloadData() 
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
}

