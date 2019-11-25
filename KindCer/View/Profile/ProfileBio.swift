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
    @ObservedObject private var keyboard = KeyboardResponder()
    @Binding var showingModal:Bool
    @State var jenisKanker : String = ""
    @State var lokasiKanker : String = ""
    @State var kontakPenting : String = ""
    @State var kondisi : String = ""
    @State var diagnose : Date = Date()
    @State var userName : String = ""
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -5, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        return min...max
    }
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                VStack{
                    Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                    Text("Bio Saya").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
                    ZStack{
                        HStack {
                            Spacer()
                            Button("Simpan"){
                                print("kondisi",self.kondisi)
                                let jenis = !self.jenisKanker.isEmpty ? self.jenisKanker:""
                                let lokasi = !self.lokasiKanker.isEmpty ? self.lokasiKanker:""
                                let kontak = !self.kontakPenting.isEmpty ? self.kontakPenting:""
                                let kondisi = !self.kondisi.isEmpty ? self.kondisi:""
                                let tgl = self.diagnose
                                
                                let user = UserType(user_name: !self.userName.isEmpty ? self.userName:" ", jenis_kanker: jenis, kondisi: kondisi, kontak_penting: kontak, posisi_kanker: lokasi, tgl_diagnosis: tgl,photo: self.mUser.photo)
                                self.mUser.updateData(user: user)
                                //
                                self.showingModal = false
                            }.onAppear{
                                self.jenisKanker = self.mUser.jenis_kanker
                                self.lokasiKanker = self.mUser.posisi_kanker
                                self.kontakPenting = self.mUser.kontak_penting
                                self.kondisi = self.mUser.kondisi
                                self.diagnose = self.mUser.tgl_diagnosis
                                self.userName = self.mUser.user_name
                            }.foregroundColor(.white).padding(.init(top: -21, leading: 0, bottom: 0, trailing: 15))
                        }

                    }
                }
            }
            Form {
                Section(header: HStack {
                    Image("cancertype").resizable().frame(width: 20, height: 20)
                    Text("Nama Pengguna").font(.headline)
                }) {
                    
                    TextField("Tulis nama kamu", text: self.$userName)
                }
                Section(header: HStack {
                    Image("cancertype").resizable().frame(width: 20, height: 20)
                    Text("Jenis Kanker").font(.headline)
                }) {
                    
                    TextField("Tulis jenis kanker kamu", text: self.$jenisKanker)
                }
                Section(header: HStack {
                    Image("cancersite").resizable().frame(width: 10, height: 20)
                    Text("Posisi Kanker").font(.headline)
                }) {
                    
                    TextField("Tulis letak kanker kamu", text: self.$lokasiKanker)
                }
                Section(header: HStack {
                    Image("diagnosis").resizable().frame(width: 20, height: 20)
                    Text("Tanggal Diagnosis").font(.headline)
                }) {
                    DatePicker("Kapan terdiagnosa",selection: $diagnose,in: dateClosedRange, displayedComponents: .date)
                }
                Section(header: HStack {
                    Image("Contact").resizable().frame(width: 20, height: 20)
                    Text("Kontak Penting").font(.headline)
                }) {

                    TextField("Tulis kontak penting anda disini", text: self.$kontakPenting) .keyboardType(.phonePad)

                }
                Section(header: HStack {
                    Image("circle").resizable().frame(width: 20, height: 20)
                    Text("Kondisi Saya").font(.headline)
                }) {
                    MultilineTextView(text: self.$kondisi).frame(height: 200)
                }
            }.edgesIgnoringSafeArea(.all)
                .padding(.bottom, keyboard.currentHeight)
//            .background(GeometryGetter(rect: $kGuardian.rects[0]))
        }
    }
    func endEditing(_ force: Bool){
        UIApplication.shared.endEditing()
    }
}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {

        let myTextView = UITextView()
        myTextView.delegate = context.coordinator

        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        return myTextView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: MultilineTextView

        init(_ uiTextView: MultilineTextView) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.text = textView.text
        }
    }
}

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct ProfileBio_Previews: PreviewProvider {
//    @State var isSheet = true
//    static var previews: some View {
//        ProfileBioAdd(showingModal: $isSheet)
//    }
//}
