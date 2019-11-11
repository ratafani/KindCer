//
//  QuizCategoryView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 24/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct QuizCategoryView: View {
    var body: some View {
        VStack{
            HStack {
                Text("Yuk, asah pengetahuan seputar pencegahan kanker serviks").font(.system(size:24)).bold().padding()
                Spacer()
            }.padding(.bottom,10)
            Spacer()
            ScrollView{
                VStack{
                    QuizCategoryCard()
                    QuizCategoryCard()
                    QuizCategoryCard()
                    QuizCategoryCard()
                    QuizCategoryCard()
                    
                }
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9466523528, green: 0.9410246611, blue: 0.9509779811, alpha: 1))).edgesIgnoringSafeArea(.all))
        
    }
}

struct QuizCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCategoryView()
    }
}
