//
//  TambahCatatanView.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct TambahCatatanView: View {
    
    @Binding var catatan : String
    @Binding var isSheet : Bool
    @State var tambah = ""
    var body: some View {
        
        VStack{
            
            formLargeSizeTextField(title: "Tambah Catatan", icon: "pensil", width: 24, height: 24, textField: $tambah) .frame(height: 200)
            
            Spacer()
            
            ButtonDefault(buttonContent: "Tambah Catatan").onTapGesture {
//                print("Tambah Catatan")
                self.catatan = self.tambah
                self.isSheet = false
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
        
        
    }
}

//struct TambahCatatanView_Previews: PreviewProvider {
//    static var previews: some View {
//        TambahCatatanView()
//    }
//}