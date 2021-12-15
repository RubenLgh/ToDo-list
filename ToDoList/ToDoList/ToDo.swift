//
//  ToDo.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 03/12/2021.
//

import UIKit

class ToDo: NSObject {
    var nom = String()
    var desc = String()
    var date = Date()
    var valide = Bool()
    
    init(nom : String, desc : String, date : Date){
        self.nom = nom
        self.desc = desc
        self.date = date
        valide = false
    }
    
    
}
