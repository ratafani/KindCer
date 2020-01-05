//
//  ObatIsEmpty.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 02/01/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ObatIsEmpty: View {
    var body: some View {
        ZStack{
            Rectangle().frame( width:400,height: 217).foregroundColor(.white).cornerRadius(10)
            VStack{
                Image("EmptyRecord").resizable().frame(width: 103.75, height: 102)
                Text("Tambahkan Obat").bold().font(.system(size: 16)).padding(.horizontal)
                Text("Kumpulkan obat harian kamu disini.").multilineTextAlignment(.center).lineLimit(2).font(.system(size: 13)).padding(.bottom)
                //                Spacer()
            }
        }
    }
}

struct ObatIsEmpty_Previews: PreviewProvider {
    static var previews: some View {
        ObatIsEmpty()
    }
}
