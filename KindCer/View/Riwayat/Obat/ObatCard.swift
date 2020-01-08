//
//  ObatCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 04/01/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ObatCard: View {
    
    @State var obat : ObatType = ObatType(id: StaticModel.id, name: "obat pusing", jadwal: [], jenis: "", aturan: "sesudah makan")
    @ObservedObject var mObat : ObatModel
    var body: some View {
        ZStack{
            Rectangle().frame( height: 100).foregroundColor(.white).cornerRadius(10)
            HStack{
                ZStack {
                    
                    ProgressCircle(value: getHowMany(),
                                   maxValue: Double(obat.jadwal.count),
                                   style: .line,
                                   foregroundColor: Color("Primary"),
                                   lineWidth: 5)
                    Text(getValue()).foregroundColor(Color("Primary")).bold()
                }.frame(width: 60, height: 60)
                    .padding()
                VStack(alignment: .leading){
                    Text(obat.name) .font(.system(size: 18)) .fontWeight(.semibold)
                    Text("")
                    Text(obat.aturan).font(.system(size: 15)) .fontWeight(.medium).foregroundColor(.gray)
                }
                Spacer()
                VStack{
                    if isSelesai(){
                        Text("Selesai").bold().foregroundColor(Color("Primary")).font(.system(size: 22))
                    }else{
                        Text("Jam Berikutnya").foregroundColor(.gray).font(.system(size: 12))
                        Text(getNextTime()).bold().foregroundColor(Color("Primary")).font(.system(size: 22))
                    }
                }.padding(.horizontal)
                
            }
        }
    }
    
    func isSelesai()->Bool{
        let arr = Array(obat.jadwal)
        let date = Date()
        let calendar = Calendar.current

        let cHour = calendar.component(.hour, from: date)
        let cMinute = calendar.component(.minute, from: date)

        let mTime = cHour*100 + cMinute
        for a in arr{
            let string = a
            if let number = Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                if mTime < number{
                    return false
                }
            }
        }
        return true
    }
    func getNextTime()->String{
        let arr = Array(obat.jadwal)

        var time = 0
        
        let date = Date()
        let calendar = Calendar.current

        let cHour = calendar.component(.hour, from: date)
        let cMinute = calendar.component(.minute, from: date)

        let mTime = cHour*100 + cMinute
        var aTime = [Int]()
        for a in arr{
            if let number = Int(a.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                if (time < number) && (number >= mTime){
                    aTime.append(number)
                }
            }
        }
        aTime = aTime.sorted()
        time = aTime.first ?? 0
        let h = time/100
        let m = time%100
        return "\(h):\(m==0 ? "00" : String(m))"
    }
    
    func getValue()->String{
        
        return "\(Int(getHowMany()))/\(obat.jadwal.count)"
    }
    func getHowMany()->Double{
        let data = mObat.getData(obat: obat.name)
        
        return Double(data.count)
    }
}

struct ObatCard_Previews: PreviewProvider {
    static var previews: some View {
        ObatCard(mObat: ObatModel())
    }
}
