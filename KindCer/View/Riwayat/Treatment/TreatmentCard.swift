//
//  TreatmentCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 26/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct TreatmentCard: View {
    @State var statusTitle = "Chemotherapy"
    @State var mStatus : CGFloat = 350.0
    @State var days : Int = 225
    @ObservedObject var jadwalModel : JadwalModel
    @State var jadwal = JadwalType(id: StaticModel.id, name: "kemo", tempat: "tempat", tanggal: Date(), dokter: "dokter", catatan: "")
    //JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    @State var isSheet = false
    
    
    var dateFormatterDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }
    
    
    var dateFormatterMonth: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }
    
    var dateFormatterYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }
    
    var body: some View {
        ZStack{
            Rectangle().frame( height: 100).foregroundColor(.white).cornerRadius(10)
            HStack{
                ZStack {
                    Circle().foregroundColor(Color("Primary"))
                    ProgressCircle(value: Double(self.countingDays()),
                                   maxValue: 30,
                                   style: .line,
                                   foregroundColor: Color("Primary").opacity(0.5),
                                   lineWidth: 5)
                    if countingDays()>=0{
                        VStack {
                            Text("\(self.countingDays())").bold().foregroundColor(.white).font(.system(size: 20))
                            Text("hari").bold().foregroundColor(.white).font(.system(size: 10))
                        }
                    }else{
                        VStack {
                            Image(systemName: "checkmark.circle").resizable().frame(width: 50, height: 50).foregroundColor(.white)
                        }
                    }
                }.frame(width: 60, height: 60)
                    .padding()
                VStack(alignment: .leading){
                    Text(jadwal.name) .font(.system(size: 18)) .fontWeight(.bold)
                    Text("")
                    Text("\(jadwal.tanggal, formatter: dateFormatterDate) | \(jadwal.tempat)") .font(.system(size: 15)) .fontWeight(.semibold).foregroundColor(.gray)
                }
                Spacer()
                
                
            }
        }.sheet(isPresented: $isSheet) {
            SchedulePageEdit(isSheet: self.$isSheet, jItem: self.$jadwal, jadwal: self.jadwalModel)
        }.onTapGesture {
            self.isSheet = true
        }
        
    }
    
    func countingDays()->Int{
        let calendar = Calendar.current
        
        let date1 = calendar.startOfDay(for: self.jadwal.tanggal)
        let date2 = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.day], from: date2, to: date1)
        let day = components.day!
        
        return day
    }
}

struct TreatmentCard_Previews: PreviewProvider {
    static var previews: some View {
        TreatmentCard(jadwalModel: JadwalModel())
    }
}
