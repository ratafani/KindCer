//
//  SymptompsAdd.swift
//  KindCer2.0
//
//  Created by Mauldy Putra on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct SymptompsAdd: View {
    
    @State var alergi = SymptompsList(title: "Alergi", icon: "alergi", width: 23, height: 23)
    @State var bengkak = SymptompsList(title: "Bengkak di area tangan/ kaki", icon: "diare", width: 23, height: 23)
    @State var diare = SymptompsList(title: "Diare", icon: "diare", width: 23, height: 23)
    @State var demam = SymptompsList(title: "Demam", icon: "demam", width: 23, height: 23)
    @State var gatal = SymptompsList(title: "Gatal / iritasi", icon: "gatal", width: 23, height: 23)
    @State var lemas = SymptompsList(title: "Lemas", icon: "lemas", width: 23, height: 23)
    @State var lelah = SymptompsList(title: "Lemas", icon: "lemas", width: 23, height: 23)
    @State var matiRasa = SymptompsList(title: "Mati rasa / kesemutan", icon: "demam", width: 23, height: 23)
    @State var mulut = SymptompsList(title: "Mulut sakit", icon: "lemas", width: 23, height: 23)
    
    @State var muntah = SymptompsList(title: "Muntah - muntah", icon: "muntah", width: 23, height: 23)
    @State var mual = SymptompsList(title: "Mual / enek", icon: "mual", width: 23, height: 23)
    @State var sembelit = SymptompsList(title: "Sembelit", icon: "sembelit", width: 23, height: 23)
    @State var otot = SymptompsList(title: "Sakit otot / persendian", icon: "otot", width: 23, height: 23)
    @State var nafas = SymptompsList(title: "Sulit bernafas", icon: "otot", width: 23, height: 23)
    @State var makan = SymptompsList(title: "Hilang nafsu makan", icon: "mual", width: 23, height: 23)
    @State var telan = SymptompsList(title: "Susah / sakit saat menelan", icon: "muntah", width: 23, height: 23)
    @State var lainnya = SymptompsList(title: "Lainnya", icon: "lainnya", width: 23, height: 23)
    
    @ObservedObject var recordModel : RecordModel
    
    @Binding var homeSheet : Bool
    
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State var now = Date()
    
    var body: some View {
        //        SymptompsList()
        //        SymptompsAddEmpty()
        VStack {
            //            DateCard()
            NavigationView{
                ScrollView{
                    VStack{
                        Group{
                            NavigationLink(destination: addSymtompsDetail(title: "Alergi", status: "Pilih Kondisi", sympthoms: SymptompModel(type: .alergi), recordModel: recordModel, homeSheet: $homeSheet,cDate: now)){
                                alergi
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Bengkak", status: "Pilih kondisi", sympthoms: SymptompModel(type: .bengkak),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                bengkak
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Demam", status: "Pilih suhu badan", sympthoms: SymptompModel(type: .demam),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                demam
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Diare", status: "Pilih kondisi", sympthoms: SymptompModel(type: .diare),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                diare
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Gatal / iritasi", status: "Pilih kondisi", sympthoms: SymptompModel(type: .gatal),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                gatal
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Nafsu Makan", status: "Pilih kondisi", sympthoms: SymptompModel(type: .makan),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                makan
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Lemas", status: "Pilih kondisi", sympthoms: SymptompModel(type: .lemas),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                lemas
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Mati Rasa / Kesemutan", status: "Pilih kondisi", sympthoms: SymptompModel(type: .matiRasa),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                matiRasa
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Mual / Enek", status: "Pilih kondisi", sympthoms: SymptompModel(type: .mual),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                mual
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Mulut", status: "Pilih kondisi", sympthoms: SymptompModel(type: .mulut),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                mulut
                            }
                            .navigationBarTitle("\(self.now, formatter: self.dateFormatter)",displayMode: .inline).font(.system(size: 23)).buttonStyle(PlainButtonStyle())
                            .background(NavigationConfigurator { nc in
                                nc.navigationBar.barTintColor = .blue
                                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                            })
                        }
                        Group{
                            NavigationLink(destination: addSymtompsDetail(title: "Muntah", status: "Pilih kondisi", sympthoms: SymptompModel(type: .muntah),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                muntah
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Otot / Persendian", status: "Pilih kondisi", sympthoms: SymptompModel(type: .otot),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                otot
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Buang Air Besar", status: "Pilih kondisi", sympthoms: SymptompModel(type: .sembelit),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                sembelit
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Bernafas", status: "Pilih kondisi", sympthoms: SymptompModel(type: .nafas),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                nafas
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Susah Menelan", status: "Pilih kondisi", sympthoms: SymptompModel(type: .telan),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                telan
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: addSymtompsDetail(title: "Lainnya", status: "Pilih kondisi", sympthoms: SymptompModel(type: .lainnya),recordModel: recordModel,homeSheet: $homeSheet,cDate: now)){
                                lainnya
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
                }
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct DateCard: View {
    
    @State var date: String = "Sabtu, 09 November 2019"
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 414, height: 70).foregroundColor(.white)
            HStack {
                Text(date).bold().padding(.leading).font(.system(size: 23))
                Spacer()
            }
        }
    }
}

struct SymptompsList: View {
    
    @State var title = "1213"
    @State var icon = "demam"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View {
        ZStack{
            Rectangle().frame(height: 65).foregroundColor(.white)
            HStack{
                profileIc(icon: icon, width: width, height: height, alignment: .leading).padding()
                Text(title).bold().font(.system(size: 18))
                Spacer()
//                Image("plus").padding(.trailing)
            }
        }
    }
}

//
//struct SymptompsAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        SymptompsAdd(recordModel: RecordModel())
//    }
//}
