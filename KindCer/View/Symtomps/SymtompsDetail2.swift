//
//  SymtompsDetail2.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 21/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SymtompsDetail2: View {
    
    @State var navBtn = "Ubah"
    @ObservedObject var recordModel : RecordModel
    @Binding var record : RecordType
    @State var isSheet : Bool = false
    @State var theColor : Color = .red
    @State var title : String
    
    var body: some View {
        
        return VStack
            {
                ZStack {
                    headerModal(title: "Detail \(title)").onAppear{
                        print(self.record.type)
                        self.title = self.record.type
                        if self.title == "Otot / Persendian"{
                            self.title = "Otot"
                        } else if self.title == "Gatal / iritasi" {
                            self.title = "Gatal"
                        } else if self.title == "Mati Rasa / Kesemutan" {
                            self.title = "Mati Rasa"
                        } else if self.title == "Mual / enek " {
                            self.title = "Mual"
                        } else if self.title == "Susah Menelan" {
                            self.title = "Menelan"
                        }
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isSheet = true
                        }) {
                            Text(navBtn).foregroundColor(.white)
                        }
                    }.padding()
                }

                ScrollView{
                    CardKondisi(kondisi: $record.kondisi, penjelasan: $record.penjelasan,theColor: theColor)
                    
                    formLargeSize(title: "Catatan", status: $record.catatan_record, icon: "pensil", width: 25, height: 25) .frame(height: 200)
                    
                    formObat(title: "Obat", status: $record.catatan_obat, icon: "obat", width: 25, height: 25,obat: $record.obat).frame(height: 200)
                }
                
                
                
                
        }
        .background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
        .sheet(isPresented: $isSheet) {
            EditSymtompDetail(sympthoms: SymptompModel(type: self.record.type), recordModel: self.recordModel, recordDetail: self.$record, homeSheet: self.$isSheet)
        }
        
    }
    
}

//struct SymtompsDetail2_Previews: PreviewProvider {
//    static var previews: some View {
//        SymtompsDetail2(recordModel: RecordModel())
//    }
//}
