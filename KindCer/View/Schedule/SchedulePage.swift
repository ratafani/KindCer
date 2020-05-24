//
//  SchedulePage.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 15/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SchedulePage: View {
    
    @State var namaKemo : String = ""
    @State var tempatPengobatan : String = ""
    @State var dokter : String = ""
    @State var kemoSchedule : Date = Date()
    @State var catatan : String = ""
    @Binding var isSheet : Bool
    
    @ObservedObject var jadwal : JadwalModel
    @ObservedObject private var keyboard = KeyboardResponder()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 2, to: Date())!
        return min...max
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack(alignment: .center){
                    Rectangle().foregroundColor(Color("Primary")).frame(height: 70)
                    VStack{
                        Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                        Text("Tambah Jadwal").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                    }
//                        ZStack{
                    HStack{
                        Button(action: {
                             self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Tutup").foregroundColor(.white).padding(4)
                        }.padding(16)
                        Spacer()
                    }
                            HStack {
                                Spacer()
                                Button("Simpan"){
                                    self.addToCD()
                                    self.presentationMode.wrappedValue.dismiss()
                                }.foregroundColor(.white).padding(.init(top: 0, leading: 0, bottom: 0, trailing: 15))
                            }
//                        }
//                    }
                }
                Form{
                    Section(header: HStack {
                        Image("namaKemo").resizable().frame(width: 20, height: 20)
                        Text("Jenis Treatment").font(.headline)
                    }) {
                        
                        TextField("Tulis jenis treatment yang akan kamu jalankan", text: self.$namaKemo)
                    }
                    Section(header:  HStack {
                        Image("diagnosis").resizable().frame(width: 20, height: 20)
                        Text("Tanggal Kemoterapi").font(.headline)
                    }) {
                        DatePicker(
                            selection: self.$kemoSchedule,
                            in: self.dateClosedRange,
                            displayedComponents: .date,
                            label: { Text("Tanggal Kemoterapi") .font(.system(size: 15)) .opacity(0.5) }
                        )
                    }
                    
                    Section(header: HStack {
                        Image("hospitalDarkerPurple").resizable().frame(width: 20, height: 20)
                        Text("Tempat").font(.headline)
                    }) {
                        
                        TextField("Tulis tempat kamu berobat", text: self.$tempatPengobatan)
                    }
                    
                    Section(header: HStack {
                        Image("doctorDarkerPurple").resizable().frame(width: 20, height: 20)
                        Text("Dokter").font(.headline)
                    }) {
                        TextField("Tulis dokter yang akan menangani kamu", text: self.$dokter)
                    }
                    
                    Section(header: HStack {
                        Image("condition").resizable().frame(width: 20, height: 20)
                        Text("Catatan").font(.headline)
                    }) {
                        TextField("Tulis catatan kamu", text: self.$catatan)
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            }.padding(.bottom, self.keyboard.currentHeight).onAppear(){
                self.endEditing(true)
            }
        }
    }
    func addToCD(){
        let newJadwal = JadwalType(id: StaticModel.id, name: namaKemo, tempat: tempatPengobatan, tanggal: kemoSchedule, dokter: dokter, catatan: catatan)

        jadwal.saveData(jadwal: newJadwal)
    }
    
    private func endEditing(_ force: Bool){
        UIApplication.shared.endEditing()
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

extension UIApplication{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}






struct SchedulePage_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
