//
//  AddTodoView.swift
//  TodoAppp
//
//  Created by Bogibek on 15/12/23.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var todoText: String = ""
    
    @State var alertTitle: String = ""
    @State var isAlertShow: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here ....", text: $todoText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button(
                    action: saveNewTodo,
                    label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth:  .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Todo ✍️")
        .alert(isPresented: $isAlertShow, content: alertView)
        
    }
    func saveNewTodo(){
        if isValidateTitle() {
            listViewModel.addNewTodo(title: todoText)
            presentationMode.wrappedValue.dismiss()
        }
            
    }
    
    func isValidateTitle()->Bool{
        if todoText.count<3 {
            alertTitle = "Your todo must be at least 3 characters long"
            isAlertShow.toggle()
            return false
        }
        return true
    }
    
    func alertView()-> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddTodoView()
        }.environmentObject(ListViewModel())
       
    }
}
