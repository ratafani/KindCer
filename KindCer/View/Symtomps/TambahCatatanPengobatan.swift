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
    
    @State var mObat = ""
    @State var catatan = ""
    var body: some View {
        VStack{
            
            formLargeSizeTextField(title: "Nama Obat", icon: "obat", width: 24, height: 24, textField: $mObat) .frame(height: 200)
            
            formLargeSizeTextField(title: "Tambah Catatan Pengobatan", icon: "pensil", width: 24, height: 24, textField: $catatan) .frame(height: 200)
            
            Spacer()
            
            Button(action: {
//                print("Ketik tambah catatan")
                
                self.obat = self.mObat
                self.catatan_obat = self.catatan
                self.isSheet = false
            }) {
                ButtonDefault(buttonContent: "Tambah Pengobatan")
            }
            
            
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
    }
}

//struct TambahCatatanPengobatan_Previews: PreviewProvider {
//    static var previews: some View {
//        TambahCatatanPengobatan()
//    }
//}
