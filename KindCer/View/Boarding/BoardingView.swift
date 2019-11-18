//
//  BoardingView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 23/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


var cards: [OnboardingCard] = [OnboardingCard(image: "onboard1", title: "Pahami\n efek samping kemoterapi", description: "Kelola pencegahan kanker serviks dan\n lacak hasil tes anda untuk mendapatkan\n proses pencegahan yang efektif"), OnboardingCard(image: "onboard2", title: "Pantau dan Catat\n Efek Samping Kemoterapi", description: "Pemahaman yang tepat tentang kanker\n serviks dapat membantu anda\n menurunkan resiko kanker serviks."), OnboardingCard(image: "", title: "login", description: "")]

struct BoardingView: View {
    
    
    @State var isOnboardingDone = false
    
    var body: some View {
        Group{
            if isOnboardingDone {ContentView()}
            else {PageView(cards.map{OnboardingCardView(card: $0)}, isOnboardingDone: $isOnboardingDone)}
       
        }.background(Rectangle().foregroundColor(.white)).onAppear{
            let userDef = UserDefaults.standard
            self.isOnboardingDone = userDef.bool(forKey: "isBoarding")
        }
    }
}

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingView()
    }
}
