//
//  ObatPage.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 26/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ObatPage: View {
    @ObservedObject var obat : ObatModel = ObatModel()
    @State var isSheet = false
    var body: some View {
        VStack{
            HStack {
                Text("Obat Harian")
                    .bold()
                    .font(.system(size: 18))
                Spacer()
                Button(action: {
                    self.isSheet.toggle()
                }) {
                    Text("Tambah")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color("Primary"))
                }.buttonStyle(PlainButtonStyle())
            }.padding()
            if obat.listObat.isEmpty{
                ObatIsEmpty()
                Spacer()
            }else{
                ScrollView{
                    VStack{
                        ForEach(self.obat.listObat, id: \.id){ theData in
                            ObatCard(obat: theData)
                        }
                    }
                }
            }
        }.sheet(isPresented: $isSheet) {
            ObatAddNew(obatModel: self.obat)
        }
    }
}



struct ObatPage_Previews: PreviewProvider {
    static var previews: some View {
        ObatPage()
    }
}
