//
//  homeTitle.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct homeTitle: View {
    @State var title = "adsda"
    @State var subtitle = "dasda"
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(title).font(.title).bold()
                Text(subtitle).font(.title).bold()
            }
            Spacer()
            Image("photo").resizable().frame(width: 60, height: 60).scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 10)
            
        }.padding(.horizontal,20).background(Color.clear)
    }
}

struct homeTitle_Previews: PreviewProvider {
    static var previews: some View {
        homeTitle()
    }
}
