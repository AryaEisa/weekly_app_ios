//
//  StartPage.swift
//  weekly_planner_IOS_AryaEisa
//
//  Created by Arya Pour Eisa on 2024-01-19.
//

import SwiftUI

struct StartPage: View {
    @State private var navigateToSetTitle = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image(.background).resizable()
                    .frame(width: 400, height: 1100)
                    .colorMultiply(.teal)
                
               
             
                 

                
                VStack{
                    Text("Weekly-Plan").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundStyle(.cyan).padding()
                    Image(systemName: "arrowshape.down.fill").font(.largeTitle)
                        .bold()
                        .foregroundColor(.red)
                        .padding()
                    NavigationLink {
                        SetTitle()
                    } label: {
                        Image(systemName: "circle")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .background(Color.purple)
                            .clipShape(.circle)
                            .padding()
                    }
                }
                
            }
        }
    }
}



#Preview {
    StartPage()
}
