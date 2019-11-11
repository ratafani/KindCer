//
//  BoardingView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 23/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


var cards: [OnboardingCard] = [OnboardingCard(image: "cardasset1", title: "Track & manage your\n cervical cancer prevention", description: "Manage your cervical cancer prevention\n and track test result to have an efficient\n prevention program."), OnboardingCard(image: "cardasset2", title: "Better Understand\n Cervical Cancer", description: "A proper understanding of cervical\n cancer can help you to lower your\n cervical cancer risk."), OnboardingCard(image: "cardasset3", title: "Control Your Cervical\n Cancer Risk", description: "Control your cervical cancer risk with\n efficient prevention treatment and\n proper understanding.")]

struct BoardingView: View {
    
    
    @State var isOnboardingDone = false
    
    var body: some View {
        Group{
            if isOnboardingDone {LoginView()} else {PageView(cards.map{OnboardingCardView(card: $0)}, isOnboardingDone: $isOnboardingDone)}
       
        }.edgesIgnoringSafeArea(.all).background(Rectangle().foregroundColor(.white).edgesIgnoringSafeArea(.all))
    }
}

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingView()
    }
}
