//
//  recordCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct recordCard: View {
    
    @State var record : RecordType = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(),penjelasan: "")
    @State var theColor : Color = .red
    var a = ["alergi","demam","diare","gatal","lemas","mual","muntah","otot","sembelit","lainnya"]
    
    @State var isSheet = false
    var body: some View {
        let theimg = cariIcon()
        return ZStack {
            Rectangle().foregroundColor(.white)
            HStack{
                Rectangle().foregroundColor(theColor).frame(width: 4)
                Spacer()
            }
            HStack{
                Image(theimg).frame(width: 50, height: 50).padding(.horizontal,20)
                VStack(alignment: .leading){
                    Text(record.type).bold().font(.headline).padding(.vertical,5)
                    Text(record.penjelasan).foregroundColor(.gray)
                    Text(record.obat).foregroundColor(Color("Primary")).padding(.vertical,5)
                }
                Spacer()
                ZStack{
                    Rectangle().foregroundColor(theColor).frame(width: 70, height: 20).cornerRadius(15)
                    Text(record.kondisi).foregroundColor(.white).font(.footnote)
                }.padding()
            }
        }.padding(.vertical,3).onAppear{
            let a = self.record.kondisi
//            print(a)
            if a == "Sedang"{
                self.theColor = Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1))
            }else if a == "Ringan"{
                self.theColor = .blue
            }else if a == "Bahaya"{
                self.theColor = .red
            }else{
                
            }
        }.onTapGesture {
            print(self.record.kondisi)
            self.isSheet = true
        }.sheet(isPresented: $isSheet) {
            SymptompsView(record: self.record)
        }
    }
    
    func cariIcon()->String{
        switch record.type {
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

struct recordCard_Previews: PreviewProvider {
    static var previews: some View {
        recordCard(record: RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(),penjelasan: ""))
    }
}
