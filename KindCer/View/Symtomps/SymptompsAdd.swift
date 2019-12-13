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
    
    @State var listSymptomps : [String] = ["Alergi",
                                           "Bengkak di area tangan/ kaki",
                                           "Demam",
                                           "Diare",
                                           "Gatal / iritasi",
                                           "Hilang nafsu makan",
                                           "Lemas",
                                           "Mati rasa / kesemutan",
                                           "Mual - mual",
                                           "Mulut terasa sakit",
                                           "Muntah - muntah",
                                           "Sakit otot / persendian",
                                           "Sembelit",
                                           "Sulit bernafas",
                                           "Sakit saat menelan",
                                           "Lainnya"]
    
    @State var listIcon : [String:String] = ["Alergi":"alergi",
                                             "Bengkak di area tangan/ kaki":"bengkak",
                                             "Demam":"demam",
                                             "Diare":"diare",
                                             "Gatal / iritasi":"gatal",
                                             "Hilang nafsu makan":"makan",
                                             "Lemas":"lemas",
                                             "Mati rasa / kesemutan":"kesemutan",
                                             "Mual - mual":"mual",
                                             "Mulut terasa sakit":"mulut",
                                             "Muntah - muntah":"muntah",
                                             "Sakit otot / persendian":"otot",
                                             "Sembelit":"sembelit",
                                             "Sulit bernafas":"nafas",
                                             "Sakit saat menelan":"nelan",
                                             "Lainnya":"lainnya"]
    
    @State var listModel : [String:SymptompsType] =
        ["Alergi":SymptompsType.alergi,
         "Bengkak di area tangan/ kaki":SymptompsType.bengkak,
         "Diare":SymptompsType.diare,
         "Demam":SymptompsType.demam,
         "Gatal / iritasi":SymptompsType.gatal,
         "Lemas":SymptompsType.lemas,
         "Mati rasa / kesemutan":SymptompsType.matiRasa,
         "Mulut terasa sakit":SymptompsType.mulut,
         "Muntah - muntah":SymptompsType.muntah,
         "Mual / enek":SymptompsType.mual,
         "Sembelit":SymptompsType.sembelit,
         "Sakit otot / persendian":SymptompsType.otot,
         "Sulit bernafas":SymptompsType.nafas,
         "Hilang nafsu makan":SymptompsType.makan,
         "Sakit saat menelan":SymptompsType.telan,
         "Lainnya":SymptompsType.lainnya]
       
    @State var listTitle : [String:String] =
        ["Alergi":"Alergi",
         "Bengkak di area tangan/ kaki":"Bengkak",
         "Diare":"Diare",
         "Demam":"Demam",
         "Gatal / iritasi":"Gatal / iritasi",
         "Lemas":"Lemas",
         "Mati rasa / kesemutan":"Mati Rasa",
         "Mulut terasa sakit":"Mulut",
         "Muntah - muntah":"Muntah",
         "Mual - mual":"Mual - mual",
         "Sembelit":"Buang Air Besar",
         "Sakit otot / persendian":"Otot / Persendian",
         "Sulit bernafas":"Bernafas",
         "Hilang nafsu makan":"Nafsu Makan",
         "Sakit saat menelan":"Susah Menelan",
         "Lainnya":"lainnya"]
    @ObservedObject var recordModel : RecordModel
    
    @Binding var homeSheet : Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                List{
                    ForEach(listSymptomps,id:\.self) { s in
                        NavigationLink(destination: addSymtompsDetail(title: self.listTitle[s] ?? "", status: "Pilih Kondisi", sympthoms: SymptompModel(type: self.listModel[s] ?? .lainnya), recordModel: self.recordModel, homeSheet: self.$homeSheet,cDate: self.now)){
                            SymptompsList(title: s, icon: self.listIcon[s] ?? "", width: 23, height: 23)
                            }.buttonStyle(PlainButtonStyle())
                    }
                }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
                    .navigationBarTitle("\(self.now, formatter: self.dateFormatter)",displayMode: .inline).font(.system(size: 23)).buttonStyle(PlainButtonStyle())
                    .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Tutup").foregroundColor(.white)
                        }).buttonStyle(PlainButtonStyle()))
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = UIColor(named: "Primary")
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })
                
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
                ZStack{
                    Circle().foregroundColor(Color("Primary")).frame(width: 30, height: 30)
                    profileIc(icon: icon, width: width, height: height, alignment: .leading).padding().contrast(-10).saturation(-10)
                }
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
