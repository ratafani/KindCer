//
//  BoardingView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 23/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


var cards: [OnboardingCard] = [OnboardingCard(image: "onboard1", title: "Pahami\n Efek Samping Kemoterapi", description: "Ketahui semua efek samping dari\n kemoterapi dan berkonsultasi dengan\n mudah ke dokter kamu."), OnboardingCard(image: "onboard2", title: "Pantau dan Catat\n Efek Samping Kemoterapi", description: "Relia dapat memudahkan kamu untuk\n memantau dan mencatat efek samping\n dari kemoterapi yang sedang kamu\n jalani."), OnboardingCard(image: "", title: "login", description: "")]

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
            .environment(\.locale, .init(identifier: "en"))
    }
}
