//
//  TambahCatatanView.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct TambahCatatanView: View {
    
    @State var title = "Tambah Catatan"
    @Binding var catatan : String
    @Binding var isSheet : Bool
    @State var tambah = ""
    var body: some View {
        
        VStack{
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                Text("\(title)").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
                HStack{
                    Spacer()
                    Button(action: {

//                        self.catatan = self.tambah
                        self.isSheet = false
                    }) {
                        Text("Simpan").foregroundColor(.white)
                    }
                    
                }.padding(.horizontal)
            }.padding(.bottom,40)
            formLargeSizeTextField(title: "Tambah Catatan", icon: "pensil", width: 24, height: 24, textField: $catatan) .frame(height: 200)
            
            Spacer()
            
            
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
        
        
    }
}

//struct TambahCatatanView_Previews: PreviewProvider {
//    static var previews: some View {
//        TambahCatatanView()
//    }
//}
