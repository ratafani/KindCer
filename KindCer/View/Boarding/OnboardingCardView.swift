//
//  OnboardingCardView.swift
//  KindcerOnboarding
//
//  Created by Rizky Adipratama Ruddyar on 21/10/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct OnboardingCardView: View {
    
    var card: OnboardingCard
    
    var body: some View {
        VStack
            {   if card.title == "login"{
                NewLoginView()
            }else{
                
                Image("logokindceronboard") .resizable()
                    .frame(width: 231, height: 66, alignment: .center)
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                    .padding(40)
                
                Text(card.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .font(.system(size: 23))
                    .lineLimit(5)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                
                
                Text(card.description)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .lineLimit(10)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                
                
                }
        } .padding()
    }
}

struct NewLoginView : View {
    var body: some View{
        VStack
            {
                Image("logokindceronboard") .resizable()
                    .frame(width: 231, height: 66, alignment: .center) .padding(.bottom, 20)
                
                 Image("onboard3text") .resizable() .frame(width: 300, height: 21, alignment: .center)
                .padding(.bottom, 20)
                
                Text("KindCer membantu kamu menghadapi\n efek samping kemoterapi!") .font(.system(size: 18)) .foregroundColor(.gray) .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                
                Image("onboard3") .resizable() .frame(width: 330, height: 341, alignment: .center)
                .padding(.bottom, 40)
                Text("Dengan mendaftar, kamu sudah setuju dengan kebijakan\n keamanan dan syarat dan ketentuan KindCer.") .font(.system(size: 11)) .foregroundColor(.gray) .multilineTextAlignment(.center)
                
        }
        
    }
}


struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(card: cards[0])
        
    }
}
