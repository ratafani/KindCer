//
//  HomeView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var mStatus : CGFloat = 100
    var body: some View {
        VStack {
            homeTitle(title: "Good Morning,", subtitle: "tafani").padding(.top)
            ScrollView{
                VStack(alignment:.leading){
                    
                    homeCardStatus( mStatus: mStatus).frame(height: 280)
                    HStack {
                        Text("Records").bold().font(.title).padding(.horizontal)
                        Spacer()
                        Button("Add"){
                            
                        }.padding(.horizontal,20).foregroundColor(.purple)
                    }.offset(y: -30)
                    if(1<100){
                        VStack{
                            recordCard().edgesIgnoringSafeArea(.all).frame( height: 100)
                            recordCard().edgesIgnoringSafeArea(.all).frame( height: 100)
                            recordCard().edgesIgnoringSafeArea(.all).frame( height: 100)
                            recordCard().edgesIgnoringSafeArea(.all).frame( height: 100)
                            recordCard().edgesIgnoringSafeArea(.all).frame( height: 100)
                            recordCard().edgesIgnoringSafeArea(.all).frame( height: 100)
                            
                        }
                        .offset(y: -30).edgesIgnoringSafeArea(.all)
                    }else{
                        HStack {
                            Spacer()
                            record_empty_view()
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9466523528, green: 0.9410246611, blue: 0.9509779811, alpha: 1))).edgesIgnoringSafeArea(.all))
            .onAppear{
                
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
