//
//  TambahCatatanView.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct TambahCatatanView: View {
    
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var title = "Tambah Catatan"
    @Binding var catatan : String
    @Binding var isSheet : Bool
    @State var tambah = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        let name = NSLocalizedString("Tambah Catatan",comment: "")
        let mTitle = NSLocalizedString(title,comment: "")
        return VStack{
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                VStack {
                    Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                    Text(mTitle).font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
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

//                        self.catatan = self.tambah
                        self.isSheet = false
                    }) {
                        Text("Simpan").foregroundColor(.white)
                    }//.padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
                }.padding(.horizontal)
            }.offset(y: -1)
            formLargeSizeTextField(title: name, icon: "pensil", width: 24, height: 24, textField: $catatan) .frame(height: 200)
            
            Spacer()
            
//            ButtonDefault(buttonContent: "Tambah Catatan").onTapGesture {
////                print("Tambah Catatan")
//                self.catatan = self.tambah
//                self.isSheet = false
//            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all)).padding(.bottom, keyboard.currentHeight).onTapGesture {
            self.endEditing(true)
        }
    }
    private func endEditing(_ force: Bool){
        UIApplication.shared.endEditing()
    }
}

//struct TambahCatatanView_Previews: PreviewProvider {
//    static var previews: some View {
//        TambahCatatanView()
//    }
//}
