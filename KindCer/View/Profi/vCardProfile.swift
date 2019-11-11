//
//  vCard.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct vCardProfile: View {
    
    @State var width: CGFloat = 150
    @State var height: CGFloat = 150
    @State var isTapped: Bool = false
    
    var body: some View {
        VStack {
            ZStack{
                Image("cardBackground")
//                    .frame(width: 414, height: 289)
                HStack{
                    Spacer()
                    VStack{
                        
                        profilePic(width: width, height: height)
                        Text("Masha Rabbani")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 24))
                        
                    }.offset(y:30)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            
                        }) {
                            Image("edit").renderingMode(.original).offset(y:-80).padding()
                        }
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct profilePic: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View{
        Image("photo2")
            .resizable().scaledToFill()
            .frame(width: width, height: height)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .clipShape(Ellipse())
    }
}

struct vCard_Previews: PreviewProvider {
    static var previews: some View {
        vCardProfile()
    }
}
