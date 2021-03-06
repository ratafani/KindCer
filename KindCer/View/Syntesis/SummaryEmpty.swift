//
//  SummaryEmpty.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 18/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SummaryEmpty: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            VStack {
                Image("EmptyRecord").resizable().foregroundColor(Color("Primary")).frame(width: 168, height: 157).padding(.top)
                Text("Rangkuman kamu kosong").foregroundColor(Color.init(#colorLiteral(red: 0.5215227604, green: 0.3181272149, blue: 0.8401996493, alpha: 1))).bold().padding(.bottom,10)
                Text("Kumpulkan catatan tindakan gejala sehari-hari kamu disini.").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)

            }.padding()
        }
    }
}

struct SummaryEmpty_Previews: PreviewProvider {
    static var previews: some View {
        SummaryEmpty()
    }
}
