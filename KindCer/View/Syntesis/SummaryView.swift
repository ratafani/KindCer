//
//  SummaryView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 12/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


struct SummaryView: View {
    
    @State var mTypeKey : [String] = []
    @State var picked = "Alergi"
    @State var data  = [0,32]
    @State var date = ["11 Nov","12 Nov"]
    @State var allDate : [String] = ["a","a"]
    @State var mData = [String:[RecordType]]()
    @State var isSheet  = false
    @ObservedObject var a : RecordModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                ZStack{
                    headerModal(title: "Rangkuman")
                    HStack{
                        Button(action: {
                             self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Tutup").foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            self.isSheet = true
                        }) {
                            Text("Bagikan").foregroundColor(.white)
                        }
                    }.padding(.horizontal,25)
                }
                VStack{
                    if(self.picked != "All"){
                        CustomLineView(data: self.data, date: self.date , title: self.picked, legend: "in last 23 days")
                            .frame(width: geometry.frame(in: .global).width - 50, height: geometry.frame(in: .global).height / 3)
                            .animation(.default)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            ForEach(self.mTypeKey, id: \.self) { sim in
                                Button(action: {
                                    self.picked = sim
                                    self.getData()
                                    
                                }) {
                                    
                                    Text(NSLocalizedString(sim,comment: "")).foregroundColor(.white).padding().background(Rectangle().foregroundColor(Color("Primary")).frame( height: 35).cornerRadius(5).opacity(sim == self.picked ? 1:0.4))
                                }
                            }
                        }.padding(.horizontal)
                        
                    }.padding(.horizontal)
                }.animation(.linear)
                ScrollView{
                    VStack{
                        ForEach(self.allDate, id: \.self) { sim in
                            
                                VStack{
                                    HStack{
                                        Text(sim).font(.body).bold().padding(.horizontal)
                                        Spacer()
                                    }
                                    if self.mData[sim] != nil{
                                        ForEach(self.mData[sim]!, id:\.id){ m in
                                            rangkumanDetail(mType: m,width: geometry.frame(in: .global).width )
                                        }
                                    }
                                }
                               
                            
                        }
                        
                    }.padding()
                    
                }.background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1))).edgesIgnoringSafeArea(.all).animation(.linear)
            }.onAppear{
                
                self.mTypeKey.append("All")
                for ar in self.a.allType(){
                    self.mTypeKey.append(ar)
                }
                self.picked = self.mTypeKey.first ?? ""
                self.getData()
                
            }.sheet(isPresented: self.$isSheet) {
                PDFView()
            }
            
            
        }
    }
    
    
    func getData(){
        var d = [Int]()
        var t = [String]()
        var dat = [String]()
        var data = [String:[RecordType]]()
        for an in a.mData{
            if self.picked == "All"{
                switch an.kondisi {
                case "Ringan":
                    d.append(32)
                case "Sedang":
                    d.append(64)
                case "Bahaya":
                    d.append(96)
                default:
                    d.append(32)
                }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM"
                t.append("\(dateFormatter.string(from: an.tanggal))")
                dateFormatter.dateFormat = "dd MMM YYYY"
                dat.append("\(dateFormatter.string(from: an.tanggal))")
                if data["\(dateFormatter.string(from: an.tanggal))"] == nil{
                    data["\(dateFormatter.string(from: an.tanggal))"] = [an]
                }else{
                    data["\(dateFormatter.string(from: an.tanggal))"]?.append(an)
                }
            }else
            if an.type == self.picked{
                switch an.kondisi {
                case "Ringan":
                    d.append(32)
                case "Sedang":
                    d.append(64)
                case "Bahaya":
                    d.append(96)
                default:
                    d.append(32)
                }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM"
                t.append("\(dateFormatter.string(from: an.tanggal))")
                dateFormatter.dateFormat = "dd MMM YYYY"
                dat.append("\(dateFormatter.string(from: an.tanggal))")
                if data["\(dateFormatter.string(from: an.tanggal))"] == nil{
                    data["\(dateFormatter.string(from: an.tanggal))"] = [an]
                }else{
                    data["\(dateFormatter.string(from: an.tanggal))"]?.append(an)
                }
                
            }
        }
        if d.count < 2{
            d.append(d.first!)
            t.append(t.first!)
        }
        self.date = t
        self.data = d
        self.allDate = dat.uniques
        self.mData = data
        
    }
    
}


struct rangkumanDetail:View {
    @State var mType : RecordType
    @State var width : CGFloat
    var body: some View{
        let a = NSLocalizedString(mType.type,comment: "")
        let b = NSLocalizedString(mType.kondisi,comment: "")
        let c = NSLocalizedString(mType.penjelasan,comment: "")
        return ZStack{

            Rectangle().foregroundColor(.white).frame(width:width,height: 100)
            HStack{
                Image(cariIcon()).frame(width: 30, height: 30).contrast(-10).saturation(-10).background(Circle().foregroundColor(choseColor())).padding(.horizontal)
                VStack(alignment: .leading){
                    Spacer()
                    HStack{
                        Text(a + " -").bold().font(.headline).padding(.bottom,5)
                        Text(b).foregroundColor(choseColor()).bold().font(.headline).padding(.bottom,5)
                    }
                    
                    
                    Text(c).font(.subheadline)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func choseColor()->Color{
        let a = self.mType.kondisi
        //            print(a)
        var theColor = Color.red
        if a == "Sedang"{
            theColor = Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1))
        }else if a == "Ringan"{
            theColor = .blue
        }else if a == "Bahaya"{
            theColor = .red
        }else{
            
        }
        return theColor
    }
    
    func cariIcon()->String{
        switch mType.type {
        case "Alergi":
            return "alergi"
        case "Diare":
            return "diare"
        case "Bengkak":
            return "diare"
        case "Demam":
            return "demam"
        case "Gatal / iritasi":
            return "gatal"
        case "Nafsu Makan":
            return "mual"
        case "Lemas":
            return "lemas"
        case "Mual / Enek":
            return "mual"
        case "Mati Rasa / Kesemutan":
            return "demam"
        case "Mulut":
            return "lemas"
        case "Muntah":
            return "muntah"
        case "Otot / Persendian":
            return "otot"
        case "Buang Air Besar":
            return "sembelit"
        case "Bernafas":
            return "otot"
        case "Saat Menelan":
            return "lemas"
        case "Lainnya":
            return "lainnya"
            
        default:
            return "alergi"
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(a:RecordModel())
    }
}
