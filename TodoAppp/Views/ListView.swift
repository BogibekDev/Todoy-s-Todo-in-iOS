//
//  ListView.swift
//  TodoAppp
//
//  Created by Bogibek on 14/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.todos.isEmpty {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.todos){todo in
                        ListRowView(todo: todo).onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateTodo(todo: todo)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteTodo)
                    .onMove(perform: listViewModel.moveTodo)
                }
            
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Today's Todo")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddTodoView()
            )
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}


