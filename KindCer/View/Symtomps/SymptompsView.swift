//
//  SymptompsView.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI
import CoreData



struct SymptompsView: View {
    
    @State var navBtn = "Edit"
    @ObservedObject var recordModel : RecordModel
    @State var record : RecordType = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
    @State var isSheet : Bool = false
    @State var theColor : Color = .red
    
    var body: some View {
        
        return VStack
            {
                ZStack {
                    headerModal(title: "Detail \(recordModel.recordAtIndex(id: record.id).type)")
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isSheet = true
                        }) {
                            Text(navBtn).foregroundColor(.white)
                        }
                    }.padding()
                }
                Spacer(minLength: 150)
                
                
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isSheet) {
                EditSymtompDetail(sympthoms: SymptompModel(type: self.record.type), recordModel: self.recordModel, recordDetail: self.$record, homeSheet: self.$isSheet)
        }
        
    }
    
}


struct SymptompsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptompsView(recordModel: RecordModel())
    }
}
