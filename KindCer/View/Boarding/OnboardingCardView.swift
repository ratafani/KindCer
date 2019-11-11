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
            {
                Image("kindcerlogowelcome") .resizable()
                    .frame(width: 231, height: 113, alignment: .center)
                

            
                
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
                    
                    
                
                Text(card.description)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                .lineLimit(10)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    
                
                
            } .padding()
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(card: cards[0])
        
    }
}
