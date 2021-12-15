//
//  ToDoList.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 15/12/2021.
//

import UIKit

class ToDoList: NSObject {
    
    var nomCategorie = String()
    
    var liste = [ToDo]()
    
    init(nom : String){
        self.nomCategorie = nom
    }
    

}
