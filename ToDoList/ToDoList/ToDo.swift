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

    init(nom : String, desc : String){
        self.nom = nom
        self.desc = desc
    }
    
    
}
