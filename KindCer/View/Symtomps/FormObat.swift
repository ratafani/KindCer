//
//  FormObat.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 21/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


struct formObat: View{
    
    @State var title = "1213"
    @Binding var status :String
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    @Binding var obat :String
    
    var body: some View{
        let a = NSLocalizedString(title,comment: "")
        let b = NSLocalizedString(obat,comment: "")
        let c = NSLocalizedString(status.isEmpty ? "Tidak ada catatan":status ,comment: "")
        return VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    HStack{
                        setImage(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            
                            
                            Text(a)
                                .bold()
                                .font(.system(size: 18))
                            
                            if !obat.isEmpty{
                                
                                
                                Text(b).font(.system(size: 13)).foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).font(.footnote).background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.5221666694, green: 0.3157750666, blue: 0.8402488828, alpha: 1))).frame(height: 30).cornerRadius(10)).padding(.vertical)
                                
                            }
                            
                            
                            
                            
                            Text(c)
                                .opacity(0.5)
                                .font(.system(size: 15))
                        } .padding(.trailing, 8)
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}
