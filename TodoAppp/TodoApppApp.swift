//
//  TodoApppApp.swift
//  TodoAppp
//
//  Created by Bogibek on 14/12/23.
//

import SwiftUI

@main
struct TodoApppApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView() 
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
           
        }
    }
}
