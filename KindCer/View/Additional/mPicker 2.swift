//
//  mPicker.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI


struct PickerForm: View {
    
    @State var title = ""
    @State var aman = "Aman :"
    @State var ringan = "Ringan"
    @State var sedang = "Sedang"
    @State var parah = "Bahaya"
    @State var penjelasanAman : String = "1"
    @State var penjelasanRingan : String = "1"
    @State var penjelasanSedang : String = "1"
    @State var penjelasanParah : String = "1"
    
    
    @Binding var kondisi : String
    @Binding var isSheet : Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View{
        let mRingan = NSLocalizedString(ringan,
        comment: " ") + " :"
        let mRinganPenjelasan = NSLocalizedString(penjelasanRingan,
        comment: " ")
        
        let mSedang = NSLocalizedString(sedang,
        comment: " ") + " :"
        let mSedangPenjelasan = NSLocalizedString(penjelasanSedang,
        comment: " ")
        
        let mParah = NSLocalizedString(parah,
        comment: " ") + " :"
        let mParahPenjelasan = NSLocalizedString(penjelasanParah,
        comment: " ")
        
        return VStack{
            ZStack{
                headerModalPicker(title: title)
                HStack{
                    Button(action: {
                         self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Tutup").foregroundColor(.white).padding(4)
                    }.padding(16)
                    Spacer()
                }
            }
            Spacer()
            Form{
                Section(header: Text("Pilih salah satu"), content: {
                    HStack {
                        Circle().foregroundColor(Color.init(#colorLiteral(red: 0.06666666667, green: 0.5960784314, blue: 0.8941176471, alpha: 1))).frame(width: 24, height: 24)
                        Text(mRingan).bold().font(.system(size: 18))
                        Text(mRinganPenjelasan).font(.system(size: 18))
                    }.onTapGesture {
                        self.mChoose(id: 0)
                    }
                    HStack {
                        Circle().foregroundColor(Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1))).frame(width: 24, height: 24)
                        Text(mSedang).bold().font(.system(size: 18))
                        Text(mSedangPenjelasan).font(.system(size: 18))
                    }.onTapGesture {
                        self.mChoose(id: 1)
                    }
                    HStack {
                        Circle().foregroundColor(Color.init(#colorLiteral(red: 0.7960784314, green: 0.1019607843, blue: 0.3450980392, alpha: 1))).frame(width: 24, height: 24)
                        Text(mParah).bold().font(.system(size: 18))
                        Text(mParahPenjelasan).font(.system(size: 18))
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
