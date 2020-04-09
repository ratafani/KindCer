//
//  CovidView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 08/04/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct CovidView: View {
    @ObservedObject var covidModel : CovidModel
    @ObservedObject var recordModel : RecordModel
    @State var load = true
    @State var fever = ""
    @State var cough = ""
    @State var breath = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "xmark.circle.fill").frame(width: 50, height: 50).foregroundColor(.primary)
                Spacer()
            }.padding(5).onTapGesture {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            if covidModel.timeSeries?.Indonesia.isEmpty ?? true{
                Spacer()
                SpinnerView(isAnimating: $load, style: .large)
                Spacer()
            }else{
                VStack {
                    HStack {
                        Spacer()
                        Text("Covid-19 symptoms")
                            .font(.system(size: 24))
                            .bold()
                        Spacer()
                    }.padding(10)
                    
                    HStack {
                        
                        Text("Fever : \(fever)")
                            .font(.system(size: 14))
                            .onAppear{
                                var tmp = false
                                var r = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
                                for a in self.recordModel.mData{
                                    if a.type == "Demam"{
                                        tmp = true
                                        r = a
                                    }
                                }
                                if tmp{
                                    let formatter = DateFormatter()
                                    
                                    formatter.dateFormat = "yyyy-MM-dd"
                                    
                                    self.fever = "Terakhir demam \(formatter.string(from: r.tanggal))"
                                }else{
                                    self.fever = "Tidak ada catatan demam"
                                }
                        }
                        Spacer()
                    }.padding(5)
                    HStack {
                        
                        Text("Coughing : \(cough)")
                            .font(.system(size: 14))
                            .onAppear{
                                var tmp = false
                                var r = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
                                for a in self.recordModel.mData{
                                    if a.type == "Mual - mual"{
                                        tmp = true
                                        r = a
                                    }
                                }
                                if tmp{
                                    let formatter = DateFormatter()
                                    
                                    formatter.dateFormat = "yyyy-MM-dd"
                                    
                                    self.cough = "Terakhir Mual - mual \(formatter.string(from: r.tanggal))"
                                }else{
                                    self.cough = "Tidak ada catatan Mual - mual"
                                }
                        }
                        
                        Spacer()
                    }.padding(5)
                    HStack {
                        
                        Text("Short of breath : \(breath)")
                            .font(.system(size: 14))
                            .onAppear{
                                var tmp = false
                                var r = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
                                for a in self.recordModel.mData{
                                    if a.type == "Sulit bernafas"{
                                        tmp = true
                                        r = a
                                    }
                                }
                                if tmp{
                                    let formatter = DateFormatter()
                                    
                                    formatter.dateFormat = "yyyy-MM-dd"
                                    
                                    self.breath = "Terakhir sesak nafas \(formatter.string(from: r.tanggal))"
                                }else{
                                    self.breath = "Tidak ada catatan Sulit bernafas"
                                }
                        }
                        Spacer()
                    }.padding(5)
                    
                }.background(Rectangle().cornerRadius(10).foregroundColor(.white).shadow(radius: 10)).padding()
                LineView(on: false, covidModel: covidModel).frame(width: 350).padding(.horizontal)
                
                List(){
                    
                    ForEach(0..<(covidModel.timeSeries?.Indonesia.count ?? 0)){ i in
                        HStack {
                            
                            Text("C: \(self.covidModel.timeSeries?.Indonesia.reversed()[i].confirmed ?? 0)").foregroundColor(.blue)
                            Text("D: \(self.covidModel.timeSeries?.Indonesia.reversed()[i].deaths ?? 0)").foregroundColor(.red)
                            Text("R: \(self.covidModel.timeSeries?.Indonesia.reversed()[i].recovered ?? 0)").foregroundColor(.green)
                            Spacer()
                            Text("\(self.covidModel.timeSeries?.Indonesia.reversed()[i].date ?? "")")
                        }
                    }
                }.animation(.easeIn(duration: 1))
            }
            
        }//VStack
    }
}

struct CovidView_Previews: PreviewProvider {
    static var previews: some View {
        CovidView(covidModel: CovidModel(), recordModel: RecordModel())
    }
}
