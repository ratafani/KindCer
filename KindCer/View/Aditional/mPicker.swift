//
//  mPicker.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI


struct PickerForm: View {
    
    @State var aman = "Aman :"
    @State var ringan = "Ringan :"
    @State var sedang = "Sedang :"
    @State var parah = "Bahaya :"
    @State var penjelasanAman : String = "1"
    @State var penjelasanRingan : String = "1"
    @State var penjelasanSedang : String = "1"
    @State var penjelasanParah : String = "1"
    
    
    @Binding var kondisi : String
    @Binding var isSheet : Bool
    
    var body: some View{
        VStack{
            Form{
                Section(header: Text("Pilih salah satu"), content: {
                    HStack {
                        Circle().foregroundColor(Color.init(#colorLiteral(red: 0.06666666667, green: 0.5960784314, blue: 0.8941176471, alpha: 1))).frame(width: 24, height: 24)
                        Text(ringan).bold().font(.system(size: 18))
                        Text(penjelasanRingan).font(.system(size: 18))
                    }.onTapGesture {
                        self.mChoose(id: 0)
                    }
                    HStack {
                        Circle().foregroundColor(Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1))).frame(width: 24, height: 24)
                        Text(sedang).bold().font(.system(size: 18))
                        Text(penjelasanSedang).font(.system(size: 18))
                    }.onTapGesture {
                        self.mChoose(id: 1)
                    }
                    HStack {
                        Circle().foregroundColor(Color.init(#colorLiteral(red: 0.7960784314, green: 0.1019607843, blue: 0.3450980392, alpha: 1))).frame(width: 24, height: 24)
                        Text(parah).bold().font(.system(size: 18))
                        Text(penjelasanParah).font(.system(size: 18))
                    }.onTapGesture {
                        self.mChoose(id: 2)
                    }
                })
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9450980392, green: 0.937254902, blue: 0.9490196078, alpha: 1))).edgesIgnoringSafeArea(.all))
        
    }
    
    func mChoose(id : Int){
        switch id {
        case 0:
            self.kondisi = "Ringan"
        case 1:
            self.kondisi = "Sedang"
        case 2:
            self.kondisi = "Bahaya"
        default:
            self.kondisi = ""
        }
        
        self.isSheet = false
    }
}
