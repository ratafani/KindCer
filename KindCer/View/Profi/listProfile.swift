//
//  listProfile.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct listProfile: View {
    
    @State var title = "1213"
    @State var status = "12412"
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                    HStack{
                        profileIc(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                            .bold()
                                .padding(.bottom, 10)
                            Text(status)
                                .opacity(0.5)
                        }
                        Spacer()
                        Image("Path").padding(.trailing)
                    }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct profileIc: View {
    var icon: String
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment
    
    var body: some View{
        Image(icon)
        .resizable()
        .frame(width: width, height: height)
    }
}

struct listProfile_Previews: PreviewProvider {
    static var previews: some View {
        listProfile()
    }
}
