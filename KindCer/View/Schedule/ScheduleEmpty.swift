//
//  ScheduleEmpty.swift
//  KindCer
//
//  Created by Rizky Adipratama Ruddyar on 06/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ScheduleEmpty: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                                    ZStack{
                                        Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                                        VStack{
                                            Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                                            Text("Jadwal").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                                        }
                                    }

                Spacer()
            
                ZStack {
                    
                        Rectangle().foregroundColor(.clear)
                        VStack {
                           
                           Spacer()
                            Image("EmptyRecord").resizable().foregroundColor(Color("Primary")).frame(width: 168, height: 157).padding(.top)
                            Text("Belum ada jadwal").foregroundColor(Color.init(#colorLiteral(red: 0.5215227604, green: 0.3181272149, blue: 0.8401996493, alpha: 1))).bold().padding(.bottom,10)
                            Text("Mulai kumpulkan jadwal kemoterapi atau jadwal kontrol kamu sekarang").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)
                            
                            
                            Spacer()
                                   
                               ZStack {
                                
                                   Rectangle().foregroundColor(.white) .frame(height: geometry.frame(in: .global).height/9)
                                   HStack
                                       {
                                           Text("Tambahakan Di sini")
                                            .fontWeight(.bold) .font(.headline) .padding(.leading, 16)
                                           
                                           Spacer()
                                           
                                           Button(action: {
                                                             }) {
                                                                 ZStack {
                                                                     Rectangle().foregroundColor(Color("Primary")).frame(width: 100,height: 50).cornerRadius(15)
                                                                   Text("Tambah").foregroundColor(Color.white)
                                                                 }.padding(.trailing, 16)
                                                             }
                                   }.padding()
                                   }
                            
                    }
                
   
                }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9468348622, green: 0.936796844, blue: 0.9499147534, alpha: 1)))).edgesIgnoringSafeArea(.all)
        }
    }
}

struct ScheduleEmpty_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleEmpty()
    }
}
