//
//  ContentView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 14/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showSplash = true
    var body: some View {
        ZStack {
            MainView()
            if(showSplash){
                BoardingView()
                    .opacity(showSplash ? 1 : 0)
                
            }
        }
    }
    
    
    
}

struct MainView: View {
    @State private var select = 1
    var body: some View{
        TabView(selection: $select) {
            HomeView().tabItem {
                if(select==1){
                    VStack {
                        Image("home_fill")
                    }
                }else{
                    Image("home")
                }
                Text("Home")
            }.tag(1)
            QuizCategoryView().tabItem {
                if(select==2){
                    Image("quiz_fill")
                }else{
                    Image("quiz")
                }
                Text("Quiz")
            }.tag(2)
            profilePage().tabItem {
                if(select==3){
                    Image("profile_fill")
                }else{
                    Image("profile")
                }
                Text("Profile")
            }.tag(3)
        }.accentColor(Color.init(#colorLiteral(red: 0.6494396925, green: 0.42190063, blue: 0.790122211, alpha: 1))).background(Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(Color.init(#colorLiteral(red: 0.9466523528, green: 0.9410246611, blue: 0.9509779811, alpha: 1)))).edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
