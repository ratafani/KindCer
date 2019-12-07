//
//  TambahCatatanPengobatan.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct TambahCatatanPengobatan: View {
    @Binding var obat : String
    @Binding var catatan_obat : String
    @Binding var isSheet : Bool
    @ObservedObject private var keyboard = KeyboardResponder()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var title = "Tambah Obat"
    @State var mObat = ""
    @State var catatan = ""
    var body: some View {
        VStack{
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                VStack {
                    Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                    Text("\(title)").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
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
                        //                print("Ketik tambah catatan")
                        
//                        self.obat = self.mObat
//                        self.catatan_obat = self.catatan
                        self.isSheet = false
                    }) {
                        Text("Simpan").foregroundColor(.white)
                    }//.padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
                }.padding(.horizontal)
            }.padding(.bottom,40)
            formLargeSizeTextField(title: "Nama Obat", icon: "obat", width: 24, height: 24, textField: $obat) .frame(height: 200)
            
            formLargeSizeTextField(title: "Tambah Catatan Pengobatan", icon: "pensil", width: 24, height: 24, textField: $catatan_obat) .frame(height: 200)
            
            Spacer()
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all)).padding(.bottom, keyboard.currentHeight).onTapGesture {
//            self.endEditing(true)
        }
    }
    
//    private func endEditing(_ force: Bool){
//        UIApplication.shared.endEditing()
//    }
}

//struct TambahCatatanPengobatan_Previews: PreviewProvider {
//    static var previews: some View {
//        TambahCatatanPengobatan()
//    }
//}
