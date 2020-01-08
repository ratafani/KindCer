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
    @State var isDetail = false
    @State var theObat = ObatType(id: StaticModel.id, name: "", jadwal: [], jenis: "", aturan: "")
    var body: some View {
        ZStack {
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
                    List{
                        ForEach(self.obat.listObat, id: \.id){ theData in
                            ObatCard(obat: theData,mObat: self.obat).onTapGesture {
                                withAnimation{                                    self.theObat = theData
                                    self.isDetail = true
                                }
                            }
                        }.onDelete { (index) in
                            self.obat.deleteItem(id: self.obat.listObat[index.first!].id)
                            
                        }
                    }
                }
            }
            if isDetail{
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(isDetail ? 0.3 : 0)
                    .edgesIgnoringSafeArea(.all).onTapGesture {
                        withAnimation{
                         self.isDetail = false
                        }
                }
                
            }
            ObatDetail(obat: $theObat,mObat:self.obat, isDetail: $isDetail).offset(y: self.isDetail ? 0 : UIApplication.shared.keyWindow?.frame.height ?? 0 )
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
