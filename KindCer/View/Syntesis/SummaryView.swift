//
//  SummaryView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 12/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct graphModel {
    var value : Int = 0
    var date : String = ""
}

struct SummaryView: View {
    
    @State var sType = ["Alergi","Bengkak","Demam","Diare","Gatal","Nafsu Makan","Lemas","Mati Rasa","Mual","Mulut Sakit","Muntah","Sakit Otot","Sembelit","Sulit Bernafas","Sakit Menelan"]
    @State var picked = "Diare"
    @State var graphValue = [graphModel]()
    @State var data = [0,32,32,64,96,32,32,64,96]
    @State var date = ["11 Nov","12 Nov","1m3 Nov","14 Nov","15 Nov","16 Nov","17 Nov","18 Nov","19 Nov"]
    @ObservedObject var a : RecordModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Rectangle().foregroundColor(Color("Primary")).frame( height: 60)
                Text("Summary").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
            }.padding(.bottom,40)
            
            CustomLineView(data: data, date: date , title: picked, legend: "in last 23 days").frame(width: 370, height: 300).padding().offset(x: 0, y: -60)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(sType,id: \.self){ m in
                        ZStack
                            {
                                Button(action: {
                                    self.picked = m
                                    self.update(type: m)
                                    
                                }) {
                                    Text(m).foregroundColor(.white).padding().background(Rectangle().foregroundColor(Color("Primary")).frame( height: 35).cornerRadius(5).opacity(m==self.picked ? 1:0.4))
                                }
                        }
                    }
                }.padding(.horizontal,10)
                
            }.padding(.horizontal)
            Text("Kondisi Anda").font(.system(size: 24, design: .default)).bold().padding(.top)
            HStack(alignment: .center){
                ZStack{
                    Rectangle().foregroundColor(.white).cornerRadius(20).shadow(radius: 10).frame(width:100,height: 100)
                    VStack {
                        Text("Aman").font(.system(size: 26, design: .default)).bold().foregroundColor(Color("Primary")).padding(.top)
                        
                        Text("The best condition").font(.system(size: 10, design: .default)).foregroundColor(.gray)
                    }
                }.padding(5)
                ZStack{
                    Rectangle().foregroundColor(Color("Primary")).cornerRadius(20).shadow(radius: 10).frame(width:130,height: 120)
                    VStack {
                        Text("Normal").font(.system(size: 30, design: .default)).bold().foregroundColor(.white).padding(.top)
                        
                        Text("Average condition").font(.system(size: 12, design: .default)).foregroundColor(.white)
                    }
                }
                ZStack{
                    Rectangle().foregroundColor(.white).cornerRadius(20).shadow(radius: 10).frame(width:100,height: 100)
                    VStack {
                        Text("Bahaya").font(.system(size: 26, design: .default)).bold().foregroundColor(Color("Primary")).padding(.top)
                        
                        Text("The worst condition").font(.system(size: 10, design: .default)).foregroundColor(.gray)
                    }
                }.padding(5)
            }
            
            
            Spacer()
        }.edgesIgnoringSafeArea(.all).onAppear{
            self.picked = self.a.mData[0].type
            self.update(type: self.picked)
        }
    }
    
    func update(type:String){
        self.date = [" "," "]
        self.data = [0,0]
        var date2 = [String]()
        var data2 = [Int]()
        self.sType = []
        let a2 = RecordModel()
        a2.readAllData()
        var mType = [String:Bool]()
        if a2.mData.count > 0{
            

            for arr in self.a.mData{
                mType[arr.type] = true
                                //                    print(self.a.mData)
                if arr.type == self.picked{
                    
                    var num = 0
                    switch arr.kondisi {
                    case "Ringan":
                        num = 32
                    case "Sedang":
                        num = 64
                    case "Bahaya":
                        num = 96
                    default:
                        num = 0
                    }
                    print(num)
                    data2.append(num)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMM"
                    date2.append("\(dateFormatter.string(from: arr.tanggal))")
                }
            }
            for t in mType{
                if t.value{
                    self.sType.append(t.key)
                }
            }
            print(data2)
            if data2.count<2{
                data2.append(data2[0])
                date2.append(date2[0])
            }
            self.date = date2
            self.data = data2
            
        }
    }
}

//struct GraphView:View {
//    var body: some View{
//    }
//}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(a:RecordModel())
    }
}
