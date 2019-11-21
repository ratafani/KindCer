//
//  EditSymtompDetail.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 21/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct EditSymtompDetail: View {
    
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
    @Binding var recordDetail : RecordType
    @Binding var homeSheet : Bool
    @State var cDate : Date = Date()
    var body: some View{
        
        VStack {
            headerModal(title: "Edit Symtomp")
            if !(title == "Lainnya"){
                formLargeSizePath(title1: "Kondisi", title2: recordDetail.type, status: $kondisi, icon: "termometer", width: 15, height: 28).frame(width: 414, height: 89).onTapGesture {
                    self.isSheet = true
                    self.sheetId = 0
                }.onAppear{
                    self.kondisi = self.recordDetail.kondisi
                }
                
            }
            
            formLargeSizePath(title1: "Catatan", title2: "", status: $catatan, icon: "pensil", width: 25, height: 25).frame(width: 414, height: 89).onTapGesture {
                self.isSheet = true
                self.sheetId = 1
            }.onAppear{
                self.catatan = self.recordDetail.catatan_record
            }
            
            
            formLargeSizePath(title1: "Obat", title2: "", status: $obat, icon: "obat", width: 26, height: 26).frame(width: 414, height: 89).onTapGesture {
                self.isSheet = true
                self.sheetId = 2
            }.onAppear{
                self.obat =  self.recordDetail.obat
            }
            
            
            Spacer()
            Button(action: {
                                print(self.title)
                self.recordModel.updateInId(id: self.recordDetail.id, key: "kondisi", value: self.kondisi)
                self.recordModel.updateInId(id: self.recordDetail.id, key: "catatan_record", value: self.catatan)
                self.recordModel.updateInId(id: self.recordDetail.id, key: "obat", value: self.obat)
                self.recordModel.updateInId(id: self.recordDetail.id, key: "catatan_obat", value: self.catatan_obat)
                
                self.recordDetail.kondisi = self.kondisi
                self.recordDetail.catatan_record = self.catatan
                self.recordDetail.obat = self.obat
                self.recordDetail.catatan_obat = self.catatan_obat
                self.homeSheet = false
                
            }) {
                ZStack{
                    Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9137254902, green: 0.262745098, blue: 0.4901960784, alpha: 1))).frame(width: 360, height: 60).cornerRadius(15)
                    HStack {
                        Text("Simpan").foregroundColor(.white)
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
//
//struct EditSymtompDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        EditSymtompDetail()
//    }
//}
