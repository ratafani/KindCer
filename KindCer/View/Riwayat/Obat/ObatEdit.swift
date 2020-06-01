//
//  ObatEdit.swift
//  KindCer
//
//  Created by Mauldy Putra on 01/06/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ObatEdit: View {
    
    @State var namaObat = ""
    @State var aturanMinum = 0
    @State var macamAturanMinum = [NSLocalizedString("Sesudah Makan",comment: ""),NSLocalizedString("Sebelum Makan",comment: "")]
    @State var jenisObat = 0
    @State var macamJenisObat = [NSLocalizedString("Tablet",comment: ""),NSLocalizedString("Kapsul",comment: ""),NSLocalizedString("Bubuk",comment: "")]
    @State var jadwalObat = [String]()
    @State var timePicked = false
    
    @Binding var mObatType : ObatType
    @ObservedObject var obatModel : ObatModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                ZStack{
                    Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                    VStack{
                        Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                        Text("Tambah Obat").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                        ZStack{
                            HStack {
                                Button("Tutup"){
                                    self.presentationMode.wrappedValue.dismiss()
                                }.foregroundColor(.white).padding(.init(top: -21, leading: 15, bottom: 0, trailing: 0))
                                Spacer()
                                Button(action: {
                                    //                                        self.getNotification(obat: "TestData", time: Date())
                                    let mObat = ObatType(id: StaticModel.id, name: self.namaObat, jadwal: self.jadwalObat, jenis: self.macamJenisObat[self.jenisObat], aturan: self.macamAturanMinum[self.aturanMinum])
                                    self.mObatType = mObat
                                    self.obatModel.saveListObat(obat: mObat)
                                    //
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    Text("Simpan").opacity(isAbleToAdd() ? 0.3 : 1)
                                }.disabled(self.isAbleToAdd())
                                    .foregroundColor(.white)
                                    .padding(.init(top: -21, leading: 0, bottom: 0, trailing: 15))
                            }
                        }
                    }
                }
                Group {
                    Form{
                        Section(header: HStack {
                            Image("obatNama").resizable().frame(width: 20, height: 20)
                            Text("Nama Obat").font(.headline)
                        }) {
                            
                            TextField("Tulis nama obat", text: self.$namaObat).onAppear {
                                self.namaObat = self.mObatType.name
                            }
                        }
                        Section(header: HStack {
                            Image("obatMinum").resizable().frame(width: 20, height: 20)
                            Text("Aturan Minum").font(.headline)
                        }) {
                            Picker("Pilih aturan minum",selection: $aturanMinum) {
                                ForEach(0 ..< macamAturanMinum.count) {
                                    Text(self.macamAturanMinum[$0])
                                }
                            }.onAppear {
                                self.macamAturanMinum[self.aturanMinum] = self.mObatType.aturan
                            }
                        }
                        Section(header: HStack {
                            Image("obatJenis").resizable().frame(width: 20, height: 20)
                            Text("Jenis Obat").font(.headline)
                        }) {
                            Picker(selection: $jenisObat,label: Text("Pilih jenis obat")) {
                                ForEach(0 ..< macamJenisObat.count) {
                                    Text(self.macamJenisObat[$0])
                                }
                            }.onAppear {
                                self.macamJenisObat[self.jenisObat]  = self.mObatType.jenis
                            }
                        }
                        
                        Group {
                            Section(header: HStack{
                                Text("Jam Minum Obat").font(.headline)
                                Spacer()
                                Button(action: {
                                    withAnimation{
                                        self.timePicked.toggle()
                                    }
                                    
                                }) {
                                    Text("Tambah").font(.headline)
                                }
                            }) {
                                ForEach(jadwalObat,id: \.self){t in
                                    TimeView(time: t,mData: self.$jadwalObat)
                                }
                            }
                        }.onAppear {
                            self.jadwalObat = self.mObatType.jadwal
                        }
                    }
                }
            }.background(Color(#colorLiteral(red: 0.948992312, green: 0.9490415454, blue: 0.9704069495, alpha: 1)))
                .navigationBarHidden(true)
                .navigationBarTitle(Text("Tambah Obat"))
                .edgesIgnoringSafeArea([.top, .bottom])
                .overlay(Rectangle().foregroundColor(.black).opacity(self.timePicked ? 0.5 : 0).edgesIgnoringSafeArea(.all))
            
            TimePicker(picked: self.$timePicked,jadwalObat: self.$jadwalObat).offset(y: self.timePicked ? 0 : UIApplication.shared.keyWindow?.frame.height ?? 0 )
        }
    }
    
    func isAbleToAdd()->Bool{
        
        if namaObat == "" || jadwalObat.count == 0{
            return true
        }
        return false
    }
}

//struct ObatEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        ObatEdit(obatModel: ObatModel())
//    }
//}
