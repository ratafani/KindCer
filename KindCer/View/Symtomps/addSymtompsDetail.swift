//
//  addSymtompsDetail.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 14/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct addSymtompsDetail: View {
    
    @State var title = "demam"
    @State var status = "Pilih suhu badan"
   
    @State var isSheet : Bool = false
    @State var sheetId = 0
    @State var sympthoms : SymptompModel = SymptompModel(type: .lainnya)
    
    @State var kondisi = ""
    @State var catatan = ""
    @State var obat = ""
    @State var catatan_obat = ""
    
    @ObservedObject var recordModel : RecordModel
    @Binding var homeSheet : Bool
    @State var cDate : Date = Date()
    var body: some View{
        
        VStack {
            if !(title == "Lainnya"){
            formLargeSizePath(title1: "Kondisi", title2: title, status: $kondisi, icon: "termometer", width: 15, height: 28).frame(width: 414, height: 89).onTapGesture {
                self.isSheet = true
                self.sheetId = 0
                }
                
            }
            
            formLargeSizePath(title1: "Catatan", title2: "", status: $catatan, icon: "pensil", width: 25, height: 25).frame(width: 414, height: 89).onTapGesture {
                self.isSheet = true
                self.sheetId = 1
            }
            
            
            formLargeSizePath(title1: "Obat", title2: "", status: $obat, icon: "obat", width: 26, height: 26).frame(width: 414, height: 89).onTapGesture {
                self.isSheet = true
                self.sheetId = 2
            }
            
            
            Spacer()
            Button(action: {
//                print(self.title)
                var a = self.sympthoms.ringan
                if self.kondisi == "Ringan"{
                    a = self.sympthoms.ringan
                }else if self.kondisi == "Sedang"{
                    a = self.sympthoms.sedang
                }else if self.kondisi == "Bahaya"{
                    a = self.sympthoms.parah
                }
                let rec = RecordType(id: StaticModel.id, type: self.title, kondisi: self.kondisi, catatan_record: self.catatan, obat: self.obat, catatan_obat: self.catatan_obat, tanggal: self.cDate,penjelasan: a)
                self.recordModel.saveData(record: rec)
                self.homeSheet = false
            }) {
                ZStack{
                    Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9137254902, green: 0.262745098, blue: 0.4901960784, alpha: 1))).frame(width: 360, height: 60).cornerRadius(15)
                    HStack {
                        Text("Catat").foregroundColor(.white)
                    }
                }
            }.disabled(kondisi.isEmpty).opacity(kondisi.isEmpty ? 0.4:1)
            
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9450980392, green: 0.937254902, blue: 0.9490196078, alpha: 1))).edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isSheet) {
                if self.sheetId == 0{
                    PickerForm(title: self.title, penjelasanAman: self.sympthoms.aman, penjelasanRingan: self.sympthoms.ringan, penjelasanSedang: self.sympthoms.sedang, penjelasanParah: self.sympthoms.parah,kondisi: self.$kondisi,isSheet: self.$isSheet)
                }else if self.sheetId == 1{
                    TambahCatatanView(catatan: self.$catatan,isSheet: self.$isSheet)
                }else{
                    TambahCatatanPengobatan(obat: self.$obat, catatan_obat: self.$catatan_obat,isSheet: self.$isSheet)
                }
        }
        
    }
}

//struct addSymtompsDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        addSymtompsDetail(recordModel: RecordModel())
//    }
//}
