//
//  QuizCategoryCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 24/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct QuizCategoryCard: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
           
            HStack{
                Image("quizCategory").padding(10)
                VStack(alignment: .leading){
                    Text("Dasar").bold().font(.headline).padding(.vertical,5)
                    Text("Kuis seputar pengetahuan dasar kanker serviks").font(.callout).foregroundColor(.gray).lineLimit(3).frame( height: 50)
                    
                    
                    HStack {
                        ZStack(alignment: .leading) {
                            Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).frame(width: 200, height: 20).cornerRadius(15)
                            Rectangle().foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.7798698545, blue: 0.2871819437, alpha: 1))).frame(width: 50, height: 20).cornerRadius(15)
                            
                        }
                        Text("3/10").foregroundColor(.gray).bold()
                    }
                }
                Spacer()
            }
        }.padding(.vertical,3)
    }
}

struct QuizCategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        QuizCategoryCard()
    }
}
