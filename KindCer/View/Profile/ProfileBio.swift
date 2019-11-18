//
//  ProfileBio.swift
//  KindCer2.0
//
//  Created by Mauldy Putra on 11/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct ProfileBioAdd: View {
    @ObservedObject var mUser : UserModel
    @Binding var showingModal:Bool
    @State var jenisKanker : String = ""
    @State var lokasiKanker : String = ""
    @State var kontakPenting : String = ""
    @State var kondisi : String = ""
    @State var diagnose : Date = Date()
   
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        return min...max
    }
    
    var body: some View {
//        print(mUser)
        VStack{
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                Text("Bio Saya").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
            }.padding(.bottom,40)
            Form {
                        Section(header: HStack {
                            Image("cancertype").resizable().frame(width: 20, height: 20)
                            Text("Jenis Kanker").font(.headline)
                        }) {
                            
                            TextField("Tulis jenis kanker anda", text: self.$jenisKanker)
                        }
                        Section(header: HStack {
                            Image("cancersite").resizable().frame(width: 10, height: 20)
                            Text("Posisi Kanker").font(.headline)
                        }) {
                            
                            TextField("Tulis letak kanker anda", text: self.$lokasiKanker)
                        }
                        Section(header: HStack {
                            Image("diagnosis").resizable().frame(width: 20, height: 20)
                            Text("Tanggal Diagnosis").font(.headline)
                        }) {
                            DatePicker(
                                selection: $diagnose,
                                in: dateClosedRange,
                                displayedComponents: .date,
                                label: { Text("Tanggal Diagnosis") }
                            )
                        }
                        Section(header: HStack {
                            Image("Contact").resizable().frame(width: 20, height: 20)
                            Text("Kontak Penting").font(.headline)
                        }) {
                            TextField("Tulis kontak penting anda disini", text: self.$kontakPenting)
                        }
                        Section(header: HStack {
                            Image("circle").resizable().frame(width: 20, height: 20)
                            Text("Kondisi Saya").font(.headline)
                        }) {
                            MultilineTextView(text: self.$kondisi).frame(height: 200)
                        }
                        Button("Done")
                        {
                            let jenis = !self.jenisKanker.isEmpty ? self.jenisKanker:""
                            let lokasi = !self.lokasiKanker.isEmpty ? self.lokasiKanker:""
                            let kontak = !self.kontakPenting.isEmpty ? self.kontakPenting:""
                            let kondisi = !self.kondisi.isEmpty ? self.kondisi:""
                            let tgl = self.diagnose
                            
                            let user = UserType(user_name: self.mUser.user_name, jenis_kanker: jenis, kondisi: kondisi, kontak_penting: kontak, posisi_kanker: lokasi, tgl_diagnosis: tgl)
                            self.mUser.updateData(user: user)
            //
                             self.showingModal = false
                        }.onAppear{
                            self.jenisKanker = self.mUser.jenis_kanker
                            self.lokasiKanker = self.mUser.posisi_kanker
                            self.kontakPenting = self.mUser.kontak_penting
                            self.kondisi = self.mUser.kondisi
                            self.diagnose = self.mUser.tgl_diagnosis
                        }
                    }.edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

//struct ProfileBio_Previews: PreviewProvider {
//    @State var isSheet = true
//    static var previews: some View {
//        ProfileBioAdd(showingModal: $isSheet)
//    }
//}
