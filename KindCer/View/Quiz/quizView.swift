//
//  quizView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct quizView: View {
    var body: some View {
        VStack {
            QuizCard(photo:"photo",statement:"Vaccine is needed only once in your live!" ,status: "“You haven’t had a vaccine before”")
                .padding(20)
            Button("Skip"){
                
            }.padding(.bottom,20)
        }
    }
}

struct quizView_Previews: PreviewProvider {
    static var previews: some View {
        quizView()
    }
}
