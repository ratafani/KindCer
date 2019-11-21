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
    
    @State var title = "Tambah Obat"
    @State var mObat = ""
    @State var catatan = ""
    var body: some View {
        VStack{
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                Text("\(title)").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
                HStack {
                    Spacer()
                    Button(action: {
                        //                print("Ketik tambah catatan")
                        
//                        self.obat = self.mObat
//                        self.catatan_obat = self.catatan
                        self.isSheet = false
                    }) {
                        Text("Simpan").foregroundColor(.white)
                    }
                }.padding(.horizontal)
            }.padding(.bottom,40)
            formLargeSizeTextField(title: "Nama Obat", icon: "obat", width: 24, height: 24, textField: $obat) .frame(height: 200).padding()
            
            formLargeSizeTextField(title: "Tambah Catatan Pengobatan", icon: "pensil", width: 24, height: 24, textField: $catatan_obat) .frame(height: 200).padding()
            
            Spacer()
            
            
            
            
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
    }
}

//struct TambahCatatanPengobatan_Previews: PreviewProvider {
//    static var previews: some View {
//        TambahCatatanPengobatan()
//    }
//}
