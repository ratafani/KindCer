//
//  ObatCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 04/01/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ObatCard: View {
    
    @State var obat : ObatType = ObatType(id: StaticModel.id, name: "obat pusing", jadwal: Set(), jenis: "", aturan: "sesudah makan")
    
    var body: some View {
        ZStack{
            Rectangle().frame( height: 100).foregroundColor(.white).cornerRadius(10)
            HStack{
                ZStack {
                    
                    ProgressCircle(value: getHowMany(),
                                   maxValue: Double(obat.jadwal.count),
                                   style: .line,
                                   backgroundColor: Color("Primary"),
                                   foregroundColor: .white,
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
                        Text("Jam Berikutnya").foregroundColor(.gray).font(.system(size: 15))
                        Text(getNextTime()).bold().foregroundColor(Color("Primary")).font(.system(size: 22))
                    }
                }.padding(.horizontal)
                
            }
        }
    }
    
    func isSelesai()->Bool{
        return false
    }
    func getNextTime()->String{
        return "15:00"
    }
    func getValue()->String{
        
        return "\(Int(getHowMany()))/\(obat.jadwal.count)"
    }
    func getHowMany()->Double{
        return 0.0
    }
}

struct ObatCard_Previews: PreviewProvider {
    static var previews: some View {
        ObatCard()
    }
}
