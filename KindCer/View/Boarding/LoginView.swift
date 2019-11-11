//
//  LoginView.swift
//  KindcerOnboarding
//
//  Created by Rizky Adipratama Ruddyar on 21/10/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            VStack {
                Image("logo") .resizable()
                    .frame(width: 261, height: 80, alignment: .center)
                    .padding(.bottom, 24)
                    
                Text("Let’s reduce\n your cervical cancer risk!")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                .lineLimit(5)
                    .multilineTextAlignment(.center)

                Image("checklistlogin") .resizable()
                    .frame(width: 287, height: 21, alignment: .center)
                    .padding(.top,7)
            }
            
            .padding([.bottom, .top], 40)
            
            Image("loginasset") .resizable()
                .frame(width: 371, height: 308, alignment: .center)
                .padding(   .bottom,40)
            Spacer()
            loginBtn()
            Text("When you register, you’ve agreed with our Privacy Policy\n and our Terms and Condition. ")
                .font(.system(size: 11))
            .lineLimit(5)
                .multilineTextAlignment(.center)
                .padding(.top)
            Spacer()
            } .padding()
        
    }
}


struct loginBtn: View{
    var body: some View{
        Button(action: {
            
            }, label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 360, height: 60, alignment: .center)
                    .foregroundColor(Color.init("Primari"))
                .overlay(
                    Text("Sign In").foregroundColor(Color.white)
                )
                    
            }
        ).onTapGesture {
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        
    }
}
