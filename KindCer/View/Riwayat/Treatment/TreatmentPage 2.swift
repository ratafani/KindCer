//
//  TreatmentPage.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 26/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


struct TreatmentPage: View {
    
    @ObservedObject var jadwal : JadwalModel = JadwalModel()
    @State var isSheet = false
    var body: some View {
        VStack{
            HStack {
                Text("Jadwal Akan Datang")
                    .bold()
                    .font(.system(size: 18))
                Spacer()
                Button(action: {
                    self.isSheet = true
                }) {
                    Text("Tambah")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color("Primary"))
                }.buttonStyle(PlainButtonStyle())
            }.padding()
            if self.jadwal.fData.isEmpty{
                TreatmentIsEmpty()
                Spacer()
            }else{
                ScrollView{
                    VStack{
                        ForEach(self.jadwal.fData, id: \.id){ theData in
                            TreatmentCard(jadwalModel: self.jadwal,jadwal: theData)
                        }
                    }
                }
            }
            
            if !self.jadwal.pData.isEmpty{
                HStack {
                    Text("History")
                        .bold()
                        .font(.system(size: 18))
                    Spacer()
                }.padding()
                ScrollView{
                    VStack{
                        ForEach(self.jadwal.pData, id: \.id){ theData in
                            TreatmentCard(jadwalModel: self.jadwal,jadwal: theData)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: self.$isSheet) {
            SchedulePage(isSheet: self.$isSheet, jadwal: self.jadwal)
        }
    }
}

struct TreatmentPage_Previews: PreviewProvider {
    static var previews: some View {
        TreatmentPage(jadwal: JadwalModel())
    }
}
