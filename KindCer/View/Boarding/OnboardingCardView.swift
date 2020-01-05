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
        GeometryReader { geometry in
            VStack
                {
                    if self.card.title == "login"{
                    NewLoginView()
                }else{
                    
                    Image("logokindceronboard") .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.frame(in: .global).width/1.5, height: geometry.frame(in: .global).height/8)
                        .padding(.top, 80)

                    
                    Image(self.card.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                        .frame(width: geometry.frame(in: .global).width/1.5, height: geometry.frame(in: .global).width/1.5)
                    
 
                    Text(self.card.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .font(.system(size: 23))
                        .lineLimit(5)
                        .multilineTextAlignment(.center)

                        .frame(width: geometry.frame(in: .global).width/1.0, height: geometry.frame(in: .global).height/8)
                    
                    
                    Text(self.card.description)
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .lineLimit(10)
                        .multilineTextAlignment(.center)
                        .frame(width: geometry.frame(in: .global).width/1.0, height: geometry.frame(in: .global).height/6.5)
                        .offset(y: -5)

                    
                    }

            }


        }
    }
}

struct NewLoginView : View {
    var body: some View{

 GeometryReader { geometry in
       VStack
               {
                   Image("logokindceronboard") .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.frame(in: .global).width/1.5, height: geometry.frame(in: .global).height/8)
                     .padding(.bottom, 8)
                   
                 Image("onboard3text") .resizable() .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.frame(in: .global).width/1.8, height: geometry.frame(in: .global).height/32)
                   
                   Text("Relia membantu kamu menghadapi\n efek samping kemoterapi!") .font(.system(size: 18)) .foregroundColor(.gray) .multilineTextAlignment(.center)
                     .frame(width: geometry.frame(in: .global).width/1.0, height: geometry.frame(in: .global).height/9)
                   
                 Image("onboard3") .resizable() .aspectRatio(contentMode: .fit) .frame(width: geometry.frame(in: .global).width/1.2, height: geometry.frame(in: .global).height/2.0)
                                    
           }
   }

        
    }
}


struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(card: cards[0])
        
    }
}
