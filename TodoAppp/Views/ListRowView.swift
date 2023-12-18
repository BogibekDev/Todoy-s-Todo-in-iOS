//
//  ListRowView.swift
//  TodoAppp
//
//  Created by Bogibek on 14/12/23.
//

import SwiftUI

struct ListRowView: View {
    let todo:Todo
    var body: some View {
        HStack{
            Image(systemName: todo.isComplited ? "checkmark.circle" :"circle")
                .foregroundColor(todo.isComplited ? .green : .red)
            Text(todo.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(todo: Todo(title: "Test", isComplited: true))
    }
}
