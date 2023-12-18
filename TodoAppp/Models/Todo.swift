//
//  Todo.swift
//  TodoAppp
//
//  Created by Bogibek on 15/12/23.
//

import Foundation


struct Todo:Identifiable,Codable{
    let id: String
    let title: String
    let isComplited: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplited: Bool) {
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateComplition()-> Todo {
        return Todo(id: id, title: title, isComplited: !isComplited)
    }
    
}
