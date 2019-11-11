//
//  homeCardStatus.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct homeCardStatus: View {
    @State var statusTitle = "Your cervical health is unknown"
    @State var mStatus : CGFloat = 250.0
    @State var days : Int = 225
    var body: some View {
        VStack {
            ZStack {
                Image("Pattern").aspectRatio(contentMode: .fit).frame(width: 383).shadow(radius: 5)
                Text(statusTitle).foregroundColor(.white).font(.system(size: 20)).padding(.bottom,20)
            }
            ZStack {
                Rectangle().foregroundColor(.white).frame(width: 383).cornerRadius(10).shadow(radius: 10)
                VStack {
                    HStack {
                        Text("Deadline Check Up:")
                        Spacer()
                        Text("225 more days")
                    }.padding(.horizontal,25).padding(.top,10)
                    ZStack(alignment: .leading){
                        Rectangle().frame(width: 350, height: 15).foregroundColor(.init(#colorLiteral(red: 0.9316993356, green: 0.9261607528, blue: 0.9359568357, alpha: 1))).cornerRadius(10)
                        Rectangle().frame(width: mStatus, height: 15).foregroundColor(.purple).cornerRadius(10)
                        
                    }.padding(.bottom)
                    
                    HStack{
                        Image("mehIcon")
                        Text("Please add your treatment record soon").foregroundColor(.gray).font(.callout)
                        Spacer()
                    }.padding(.horizontal,30)
                    Spacer()
                }
            }.offset(y: -40)
        }
    }
}

struct homeCardStatus_Previews: PreviewProvider {
    static var previews: some View {
        homeCardStatus()
    }
}
