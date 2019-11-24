//
//  SymtompsDetail2.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 21/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SymtompsDetail2: View {
    
    @State var navBtn = "Edit"
    @ObservedObject var recordModel : RecordModel
    @Binding var record : RecordType
    @State var isSheet : Bool = false
    @State var theColor : Color = .red
    
    var body: some View {
        
        return VStack
            {
                ZStack {
                    headerModal(title: "Detail \(record.type)")
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isSheet = true
                        }) {
                            Text(navBtn).foregroundColor(.white)
                        }
                    }.padding()
                }
                CardKondisi(kondisi: $record.kondisi, penjelasan: $record.penjelasan,theColor: theColor)
                
                formLargeSize(title: "Catatan", status: $record.catatan_record, icon: "pensil", width: 25, height: 25) .frame(height: 200)
                
                formObat(title: "Obat", status: $record.catatan_obat, icon: "obat", width: 25, height: 25,obat: $record.obat) .frame(height: 200)
                
                Spacer()
                
                
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
