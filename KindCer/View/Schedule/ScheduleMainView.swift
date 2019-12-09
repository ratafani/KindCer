//
//  ScheduleMainView.swift
//  KindCer
//
//  Created by Rizky Adipratama Ruddyar on 04/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ScheduleMainView: View {
    
    @ObservedObject var userModel: UserModel
    @ObservedObject var jadwal : JadwalModel
    
    @State var isEmpty = true
    @State var isSheet = false
    @State var userName = ""
    @State var sheetType = 0
    @State var image : UIImage? = UIImage()
    @State var jItem : JadwalType = JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geometry in
            VStack
                {
                    ZStack{
                        Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                        VStack{
                            Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                            Text("Jadwal").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                            //                            ZStack{
                            //                                HStack {
                            //                                    Spacer()
                            //                                    Button("Simpan"){
                            //                                       }.foregroundColor(.white).padding(.init(top: -21, leading: 0, bottom: 0, trailing: 15))
                            //                                }
                            //                            }
                        }
                        HStack{
                            
                            Button("Tutup"){
                                self.presentationMode.wrappedValue.dismiss()
                            }.foregroundColor(Color.white).padding(.horizontal)
                            
                            Spacer()
                            
                            Button("Tambah"){
                                self.isSheet = true
                            }.foregroundColor(Color.white).padding(.horizontal)
                        }
                    }
                    
                    ScrollView(.horizontal){
                        HStack{
                            if self.jadwal.data.isEmpty{
                                ProfileCardStatusEmpty()
                            }else{
                                ForEach(self.jadwal.fData, id: \.id){ theData in
                                    ProfileCardStatus(jadwalModel: self.jadwal,jadwal: theData,homeSheet: self.$isSheet)
                                }
                            }
                            
                        }.padding(.vertical, 20)
                    }.padding(.leading)
                    
                    HStack{
                        Text("Riwayat Berobat").bold().font(.system(size: 20)).padding(.horizontal)
                        
                        Spacer()
                        
                    }.padding(.init(top: 10, leading: 0, bottom: 5, trailing: 0))
                    
                    ScrollView
                        {
                            if self.isRiwayatEmpty(){
                                CardRiwayatEmpty().frame(height: geometry.frame(in: .global).height/2)
                            }else{
                                VStack {
                                    ForEach(self.jadwal.pData, id: \.id) { jad in
                                        CardRiwayat(jadwalModel: self.jadwal, jadwal: jad)
                                    }
                                }
                            }
                    }
                    
                    
                    Spacer()
                    
                    
                    
                    
                    
            } .background(Rectangle()
                .foregroundColor(Color.init(#colorLiteral(red: 0.9468348622, green: 0.936796844, blue: 0.9499147534, alpha: 1))))
                .edgesIgnoringSafeArea(.all)
                .onAppear{
                    self.jadwal.readData()
                    
                    print(self.isRiwayatEmpty())
                    print(self.jadwal.data)
            }
            .sheet(isPresented: self.$isSheet) {
                SchedulePage(isSheet: self.$isSheet, jadwal: self.jadwal)
            }
        }
        
    }
    
    func isRiwayatEmpty()->Bool{
        
        let arr = jadwal.data
        
        for a in arr{
            if a.tanggal.timeIntervalSince1970 <= Date().timeIntervalSince1970 {
                return false
            }
        }
        
        return true
    }
}

struct ScheduleMainView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleMainView(userModel: UserModel(), jadwal: JadwalModel())
    }
}
