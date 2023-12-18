//
//  ListViewModel.swift
//  TodoAppp
//
//  Created by Bogibek on 15/12/23.
//

import Foundation
 
class ListViewModel : ObservableObject{
    
    @Published var todos:[Todo]=[]{
        didSet{
            saveTodos()
        }
    }
    
    
    let todoKey = "todos_list"
    
    
    
    init(){
        getTodos()
    }
    
    
    func getTodos(){
//        let newTodos=[
//            Todo(title: "First", isComplited: false),
//            Todo(title: "Second", isComplited: true),
//            Todo(title: "Third", isComplited: false),
//            Todo(title: "Fourth", isComplited: true),
//        ]
//   todos.append(contentsOf: newTodos)
        
        
        guard
            let data = UserDefaults.standard.data(forKey: todoKey),
            let savedTodos = try?JSONDecoder().decode([Todo].self, from: data)
        else{return}
        
        self.todos = savedTodos
    }
    
    func deleteTodo(indexSet: IndexSet){
        todos.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from: IndexSet, to:Int){
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewTodo(title:String){
        todos.append(Todo(title: title, isComplited: false))
    }
    func updateTodo(todo:Todo){
        if let index = todos.firstIndex(where:{ $0.id == todo.id }){
            //todos[index]=Todo(title: todo.title, isComplited: !todo.isComplited)
            todos[index]=todo.updateComplition()
        }
    }
    
    func saveTodos(){
        if let encodedData = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encodedData, forKey: todoKey)
        }
    }
    
}
