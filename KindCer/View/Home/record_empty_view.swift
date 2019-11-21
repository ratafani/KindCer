//
//  record_empty_view.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 23/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct RecordIsEmptView: View {
    @Binding var isSheet : Bool
    @Binding var isAlarm : Bool
    @Binding var homeSheet : HomeSheet
    @State var tanggal : Date = Date()
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            VStack {
                Image("EmptyRecord").resizable().foregroundColor(Color("Primary")).frame(width: 168, height: 157).padding(.top)
                Text("Belum ada catatan hari ini").foregroundColor(Color.init(#colorLiteral(red: 0.5215227604, green: 0.3181272149, blue: 0.8401996493, alpha: 1))).bold().padding(.bottom,10)
                Text("Kumpulkan catatan tindakan gejala sehari-hari anda disini.").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)
                Button(action: {
//                    print(self.tanggal)
                    if self.tanggal.timeIntervalSince1970 <= Date().timeIntervalSince1970{
                        
                        self.isSheet = true
                        self.homeSheet = HomeSheet.Record
                    }else{
                        self.isAlarm = true
                    }
                }) {
                    ZStack {
                        Rectangle().foregroundColor(Color("Primary")).frame(width: 300,height: 50).cornerRadius(15)
                        Text("Tambahkan Sekarang").foregroundColor(Color.white)
                    }
                }
            }.padding()
        }
    }
}

//struct record_empty_view_Previews: PreviewProvider {
//    @State var asa = true
//    static var previews: some View {
//        RecordIsEmptView(isSheet: $asa)
//    }
//}
