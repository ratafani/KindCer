//
//  SchedulePageEdit.swift
//  KindCer
//
//  Created by Mauldy Putra on 20/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SchedulePageEdit: View {
    
    @State var tempatPengobatan : String = ""
    @State var dokter : String = ""
    @State var kemoSchedule : Date = Date()
    @State var catatan : String = ""
    @Binding var isSheet : Bool
    @State var jItem : JadwalType
    @ObservedObject var jadwal : JadwalModel
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 2, to: Date())!
        return min...max
    }
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                VStack{
                    Rectangle().foregroundColor(.white).opacity(0.5).frame(width: 50, height: 5).cornerRadius(10)
                    Text("Tambah Jadwal Kemoterapi").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                    ZStack{
                        HStack {
                            Spacer()
                            Button("Done"){
                                self.addToCD()
                                self.isSheet =  false
                            }.foregroundColor(.white).padding(.init(top: -20, leading: 0, bottom: 0, trailing: 15))
                        }
                    }
                }
            }
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
                    
                    TextField("Tulis tempat anda berobat", text: self.$tempatPengobatan)
                }
                
                Section(header: HStack {
                    Image("doctorDarkerPurple").resizable().frame(width: 20, height: 20)
                    Text("Doctor").font(.headline)
                }) {
                    TextField("Tulis dokter yang akan menangani anda", text: self.$dokter)
                }
                
                Section(header: HStack {
                    Image("condition").resizable().frame(width: 20, height: 20)
                    Text("Catatan").font(.headline)
                }) {
                    TextField("Tulis catatan anda", text: self.$catatan)
                }
                
                
                Button("Hapus")
                {
                    
                }.padding(.leading, 5).foregroundColor(.red)

            }.edgesIgnoringSafeArea(.all)
        }
        
        
    }
    func addToCD(){
        let newJadwal = JadwalType(id: StaticModel.id, tempat: tempatPengobatan, tanggal: kemoSchedule, dokter: dokter, catatan: catatan)
        jadwal.saveData(jadwal: newJadwal)
    }
}

//struct SchedulePageEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        SchedulePageEdit()
//    }
//}
