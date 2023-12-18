//
//  EmptyView.swift
//  TodoAppp
//
//  Created by Bogibek on 17/12/23.
//

import SwiftUI

struct EmptyView: View {
    
    @State var isAnimate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10 ){
                Text("There is no todos !")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add a bunch of todos to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddTodoView(),
                    label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(isAnimate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                        
                })
                .padding(.horizontal, isAnimate ? 30 : 50)
                .shadow(
                    color: isAnimate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: isAnimate ? 30 : 50,
                    x: 0,
                    y: isAnimate ? -7 : 0
                )
                .scaleEffect(isAnimate ? 1.1 : 1.0)
                .offset(y: isAnimate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation(){
        guard !isAnimate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                isAnimate.toggle()
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EmptyView()
                .navigationTitle("Title")
        }
       
    }
}
