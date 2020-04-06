//
//  TreatmentIsEmpty.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 26/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct TreatmentIsEmpty: View {
    var body: some View{
        ZStack{
            Rectangle().frame( width:400,height: 217).foregroundColor(.white).cornerRadius(10)
            VStack{
                
                Image("EmptyRecord").resizable().frame(width: 103.75, height: 102)
                Text("Tambahkan Treatment").bold().font(.system(size: 16)).padding(.horizontal)
                Text("Kumpulkan jadwal kemoterapi kamu disini.").multilineTextAlignment(.center).lineLimit(2).font(.system(size: 13)).padding(.bottom)
                //                Spacer()
            }
        }
    }
}

struct TreatmentIsEmpty_Previews: PreviewProvider {
    static var previews: some View {
        TreatmentIsEmpty()
    }
}
