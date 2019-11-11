//
//  recordCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct recordCard: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            HStack{
                Rectangle().foregroundColor(.purple).frame(width: 5)
                Spacer()
            }
            HStack{
                VStack{
                    Text("15").bold().font(.title)
                    Text("Oct").foregroundColor(.gray)
                    Text("2019").font(.footnote)
                }.padding(.horizontal,20)
                VStack(alignment: .leading){
                    Text("Biopsi").bold().font(.headline).padding(.vertical,5)
                    Text("RS bunda| Jakarta").foregroundColor(.gray)
                    Text("Dr.Ivan").foregroundColor(.purple).padding(.vertical,5)
                }
                Spacer()
                ZStack{
                    Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.5478902459, green: 0.9007973075, blue: 0.3127832413, alpha: 0.6632598459))).frame(width: 70, height: 20).cornerRadius(15)
                    Text("Good").foregroundColor(Color.init(#colorLiteral(red: 0, green: 0.6248083711, blue: 0, alpha: 1))).font(.footnote)
                }.padding()
            }
        }.padding(.vertical,3)
    }
}

struct recordCard_Previews: PreviewProvider {
    static var previews: some View {
        recordCard()
    }
}
