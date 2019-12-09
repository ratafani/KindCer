//
//  CardRiwayatEmpty.swift
//  KindCer
//
//  Created by Rizky Adipratama Ruddyar on 05/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct CardRiwayatEmpty: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                   Rectangle().foregroundColor(.white)
                    //.frame(height: geometry.frame(in: .global).height/2)
                   VStack {
                       Image("EmptyRecord").resizable().foregroundColor(Color("Primary")).frame(width: 168, height: 157).padding(.top)
                       Text("Belum ada riwayat pengobatanmu").foregroundColor(Color.init(#colorLiteral(red: 0.5215227604, green: 0.3181272149, blue: 0.8401996493, alpha: 1))).bold().padding(.bottom,10)
                       Text("Kami akan mencatat riwayat pengobatan yang telah kamu lakukan di sini.").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)
                       Button(action: {

                       }) {
                           ZStack {
                               Rectangle().foregroundColor(Color("Primary")).frame(width: 300,height: 50).cornerRadius(15)
                               Text("Tambahkan Jadwal").foregroundColor(Color.white)
                           }
                       }
                   }.padding()
               }
            
        }
    }
}

struct CardRiwayatEmpty_Previews: PreviewProvider {
    static var previews: some View {
        CardRiwayatEmpty()
    }
}
