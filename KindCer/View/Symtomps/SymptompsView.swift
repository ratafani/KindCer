//
//  SymptompsView.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct SymptompsView: View {
    @State var catatan: String = "Hari ini suhu badan mencapai 38°C.Terjadi pada jam 7 malam WIB."
    @State var statusObat: String = "Paracetamol 500mg @3x sehari. Diminum setiap 30 menit setelah makan."
    
    
    @State var record : RecordType = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
    
    @State var theColor : Color = .red
    var body: some View {
        
        return VStack
            {
                CardKondisi(kondisi: $record.kondisi, penjelasan: $record.penjelasan,theColor: theColor)
                
                formLargeSize(title: "Catatan", status: record.catatan_record, icon: "pensil", width: 25, height: 25) .frame(height: 200)
                
                formObat(title: "Obat", status: record.catatan_obat, icon: "obat", width: 25, height: 25,obat: record.obat)
                
                Spacer(minLength: 150)
                
                
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
        
    }
    
}



struct formObat: View{
    
    @State var title = "1213"
    @State var status = "12412"
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    @State var obat = ""
    
    var body: some View{
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    HStack{
                        setImage(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            
                            
                            Text(title)
                                .bold()
                                .font(.system(size: 18))
                            
                            if !obat.isEmpty{
                                
                                
                                Text(obat).font(.system(size: 13)).foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).font(.footnote).background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.5221666694, green: 0.3157750666, blue: 0.8402488828, alpha: 1))).frame(height: 30).cornerRadius(10)).padding(.vertical)
                                
                            }
                            
                            
                            
                            
                            Text(status.isEmpty ? "Tidak ada catatan obat":status)
                                .opacity(0.5)
                                .font(.system(size: 15))
                        } .padding(.trailing, 8)
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}

struct SymptompsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptompsView()
    }
}
