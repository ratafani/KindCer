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
    @Binding var jItem : JadwalType
    @ObservedObject var jadwal : JadwalModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var keyboard = KeyboardResponder()
    
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
                    Text("Ubah Jadwal Kemoterapi").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                    ZStack{
                        HStack {
                            Spacer()
                            Button("Simpan"){
                                self.jadwal.updateItem(id: self.jItem.id, key: "tanggal", value: self.kemoSchedule)
                                self.jadwal.updateItem(id: self.jItem.id, key: "tempat", value: self.tempatPengobatan)
                                self.jadwal.updateItem(id: self.jItem.id, key: "catatan", value: self.catatan)
                                self.jadwal.updateItem(id: self.jItem.id, key: "dokter", value: self.dokter)
                                
                                self.jItem.tanggal = self.kemoSchedule
                                self.jItem.tempat = self.tempatPengobatan
                                self.jItem.catatan = self.catatan
                                self.jItem.dokter = self.dokter
                                
                                self.dismiss()
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
                    ).onAppear{
                        self.kemoSchedule = self.jItem.tanggal
                    }
                }
                
                Section(header: HStack {
                    Image("hospitalDarkerPurple").resizable().frame(width: 20, height: 20)
                    Text("Tempat").font(.headline)
                }) {
                    
                    TextField("Tulis tempat kamu berobat", text: self.$tempatPengobatan).onAppear{
                        self.tempatPengobatan = self.jItem.tempat
                    }
                }
                
                Section(header: HStack {
                    Image("doctorDarkerPurple").resizable().frame(width: 20, height: 20)
                    Text("Doctor").font(.headline)
                }) {
                    TextField("Tulis dokter yang akan menangani kamu", text: self.$dokter).onAppear{
                        self.dokter = self.jItem.dokter
                    }
                }
                
                Section(header: HStack {
                    Image("condition").resizable().frame(width: 20, height: 20)
                    Text("Catatan").font(.headline)
                }) {
                    TextField("Tulis catatan kamu", text: self.$catatan).onTapGesture {
                        self.catatan = self.jItem.catatan
                    }
                }
                
                
                Button(action: {
                    self.dismiss()
                    self.jadwal.deleteItem(id: self.jItem.id)
                }) {
                    Text("Hapus").foregroundColor(.red)
                }
                

            }.edgesIgnoringSafeArea(.all)
        }.padding(.bottom, keyboard.currentHeight)
        
        
        
        
    }
    
    func dismiss(){
        isSheet = false
        
        print(isSheet)
    }
}

//struct SchedulePageEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        SchedulePageEdit()
//    }
//}
