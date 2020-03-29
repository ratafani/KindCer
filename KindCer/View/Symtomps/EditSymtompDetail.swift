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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View{

        GeometryReader { geometry in
             VStack {
                ZStack(alignment: .center) {
                                Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                                VStack {
                                    Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                                    Text("Ubah Gejala").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
                                }
                                HStack{
                                    Button(action: {
                                         self.presentationMode.wrappedValue.dismiss()
                                    }) {
                                        Text("Tutup").foregroundColor(.white).padding(4)
                                    }.padding(16)
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        self.recordModel.updateInId(id: self.recordDetail.id, key: "kondisi", value: self.kondisi, tgl: self.recordDetail.tanggal)
                                                        self.recordModel.updateInId(id: self.recordDetail.id, key: "catatan_record", value: self.catatan, tgl: self.recordDetail.tanggal)
                                                        self.recordModel.updateInId(id: self.recordDetail.id, key: "obat", value: self.obat, tgl: self.recordDetail.tanggal)
                                                        self.recordModel.updateInId(id: self.recordDetail.id, key: "catatan_obat", value: self.catatan_obat, tgl: self.recordDetail.tanggal)
                                                        
                                                        self.recordDetail.kondisi = self.kondisi
                                                        self.recordDetail.catatan_record = self.catatan
                                                        self.recordDetail.obat = self.obat
                                                        self.recordDetail.catatan_obat = self.catatan_obat
                                                        self.homeSheet = false
                                    }) {
                                        Text("Simpan").foregroundColor(.white)
                                    }//.padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
                                }.padding(.horizontal)
                }.padding(.bottom,40).offset(y: -1)
//                        headerModal(title: "Edit Symtomp")
                if !(self.title == "Lainnya"){
                    formLargeSizePath(title1: "Kondisi", title2: self.recordDetail.type, status: self.$kondisi, icon: "termometer", width: 15, height: 28).frame( height: 89).onTapGesture {
                                self.isSheet = true
                                self.sheetId = 0
                            }.onAppear{
                                self.kondisi = self.recordDetail.kondisi
                            }
                            
                        }
                        
                formLargeSizePath(title1: "Catatan", title2: "", status: self.$catatan, icon: "pensil", width: 25, height: 25).frame( height: 89).onTapGesture {
                            self.isSheet = true
                            self.sheetId = 1
                        }.onAppear{
                            self.catatan = self.recordDetail.catatan_record
                        }
                        
                        
                formLargeSizePath(title1: "Obat", title2: "", status: self.$obat, icon: "obat", width: 26, height: 26).frame(  height: 89).onTapGesture {
                            self.isSheet = true
                            self.sheetId = 2
                        }.onAppear{
                            self.obat =  self.recordDetail.obat
                        }
                        
                        
                        Spacer()
//                        Button(action: {
//
//                            self.recordModel.updateInId(id: self.recordDetail.id, key: "kondisi", value: self.kondisi, tgl: self.recordDetail.tanggal)
//                            self.recordModel.updateInId(id: self.recordDetail.id, key: "catatan_record", value: self.catatan, tgl: self.recordDetail.tanggal)
//                            self.recordModel.updateInId(id: self.recordDetail.id, key: "obat", value: self.obat, tgl: self.recordDetail.tanggal)
//                            self.recordModel.updateInId(id: self.recordDetail.id, key: "catatan_obat", value: self.catatan_obat, tgl: self.recordDetail.tanggal)
//
//                            self.recordDetail.kondisi = self.kondisi
//                            self.recordDetail.catatan_record = self.catatan
//                            self.recordDetail.obat = self.obat
//                            self.recordDetail.catatan_obat = self.catatan_obat
//            //                self.recordModel.readData(date: self.recordDetail.tanggal)
//                            self.homeSheet = false
//            //                print(self.recordModel.recordAtIndex(id: self.recordDetail.id))
//                        }) {
//                            ZStack{
//                                Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9137254902, green: 0.262745098, blue: 0.4901960784, alpha: 1))).frame(width: geometry.frame(in: .global).width/1.3, height: geometry.frame(in: .global).height/13.3).cornerRadius(10)
//                                HStack {
//                                    Text("Simpan").foregroundColor(.white)
//                                }
//                            }.padding(.bottom, 40)
//                        }.disabled(self.kondisi.isEmpty).opacity(self.kondisi.isEmpty ? 0.4:1)
                        
                    }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9450980392, green: 0.937254902, blue: 0.9490196078, alpha: 1))).edgesIgnoringSafeArea(.all))
                .sheet(isPresented: self.$isSheet) {
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
       
}
//
//struct EditSymtompDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        EditSymtompDetail()
//    }
//}
