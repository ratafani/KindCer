//
//  SchedulePage.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 15/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SchedulePage: View {
    
    @State var tempatPengobatan : String = ""
    @State var dokter : String = ""
    @State var kemoSchedule : Date = Date()
    @State var catatan : String = ""
    @Binding var isSheet : Bool
    
    @ObservedObject var jadwal : JadwalModel
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 2, to: Date())!
        return min...max
    }
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                Text("Tambah Jadwal Kemoterapi").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
            }.padding(.bottom,40)
            Form{
                
                Section(header:  HStack {
                    Image("diagnosis").resizable().frame(width: 20, height: 20)
                    Text("Tanggal Kemoterapi").font(.headline)
                }) {
                    DatePicker(
                        selection: $kemoSchedule,
                        in: dateClosedRange,
                        displayedComponents: .date,
                        label: { Text("Tanggal Kemoterapi") .font(.system(size: 15)) .opacity(0.5) }
                    )
                }
                
                Section(header: HStack {
                    Image("hospitalDarkerPurple").resizable().frame(width: 20, height: 20)
                    Text("Tempat").font(.headline)
                }) {
                    
                    TextField("", text: self.$tempatPengobatan)
                }
                
                Section(header: HStack {
                    Image("doctorDarkerPurple").resizable().frame(width: 20, height: 20)
                    Text("Doctor").font(.headline)
                }) {
                    TextField("", text: self.$dokter)
                }
                
                Section(header: HStack {
                    Image("condition").resizable().frame(width: 20, height: 20)
                    Text("Catatan").font(.headline)
                }) {
                    TextField("", text: self.$catatan)
                }
                
                
                Button("Done")
                {
                    self.addToCD()
                    self.isSheet =  false
                } .padding(.leading, 5)

            }.edgesIgnoringSafeArea(.all)
        }
        
        
    }
    func addToCD(){
        let newJadwal = JadwalType(id: StaticModel.id, tempat: tempatPengobatan, tanggal: kemoSchedule, dokter: dokter, catatan: catatan)
        jadwal.saveData(jadwal: newJadwal)
    }
}



struct catatanBox: View{
    
    var body: some View{
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                HStack{
                    Text("Belum ada catatan") .opacity(0.5) .font(.system(size: 14))
                    Spacer()
                    Image("Path").padding(.trailing)
                }
            }
        }
    }
}





