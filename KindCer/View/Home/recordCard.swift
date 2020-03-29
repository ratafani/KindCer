//
//  recordCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


struct recordBody: View {
    @Binding var record : RecordType
    
    let moderateDangerous = ["Alergi", "Demam", "Muntah", "Mulut", "Sembelit", "Susah Menelan", "Bengkak", "Bernafas"]
    var body: some View{
        let type = NSLocalizedString(record.type,
        comment: "") + " -"
        let kondisi = NSLocalizedString(record.kondisi,
        comment: "")
        let penjelasan = NSLocalizedString(record.penjelasan,
        comment: "")
        return ZStack {
            Rectangle().foregroundColor(.white)
            HStack{
                Rectangle().foregroundColor(choseColor()).frame(width: 4)
                Spacer()
            }
            HStack{
                ZStack{
                    Circle().foregroundColor(choseColor()).frame(width: 30, height: 30)
                    Image(cariIcon()).frame(width: 50, height: 50).padding(.horizontal,20).contrast(-10).saturation(-10)
                }
                VStack(alignment: .leading){
                    HStack{
                        Text(type).bold().font(.headline)
                        Text(kondisi).bold().foregroundColor(choseColor()).font(.headline)
                    }.padding(.top, 10)
                    Text(penjelasan).foregroundColor(.gray).padding(.top, 10).padding(.bottom, 10)
                }
                
                Spacer()
                if toDoctor(){
                    Image("Warning").resizable().frame(width: 80, height: 60).padding()
                }
            }
        }.padding(.vertical,3)
    }
    
    func toDoctor()->Bool{
        if record.kondisi == "Bahaya"{
            return true
        }else if record.type == "Gatal / iritasi"{
            return true
        }else{
            for a in moderateDangerous{
                if record.type == a && record.kondisi == "Sedang"{
                    return true
                }
            }
        }
        
        return false
    }
    
    func choseColor()->Color{
        let a = self.record.kondisi
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

struct recordCard: View {
    
    @State var record : RecordType
    @State var theColor : Color = .red
    
    @ObservedObject var recordModel : RecordModel
    
    var a = ["alergi","demam","diare","gatal","lemas","mual","muntah","otot","sembelit","lainnya"]
    
    @Binding var isSheet : Bool
    @State var isSheet2 : Bool = false
    @Binding var homeSheet : HomeSheet
    @Binding var theRecord : RecordType
    
    var body: some View {
        recordBody(record: self.$record).onTapGesture {
            
            self.isSheet2 = true
            //            self.homeSheet = HomeSheet.rDetail
            //            self.theRecord = self.record
        }.sheet(isPresented: $isSheet2) {
            SymtompsDetail2(recordModel: self.recordModel, record: self.$record)
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

//struct recordCard_Previews: PreviewProvider {
//    static var previews: some View {
//        recordCard(record: RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(),penjelasan: ""), recordModel: RecordModel(), isSheet: $is)
//    }
//}
