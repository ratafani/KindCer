//
//  CardRiwayat.swift
//  KindCer
//
//  Created by Rizky Adipratama Ruddyar on 04/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct CardRiwayat: View {
    
    @ObservedObject var jadwalModel : JadwalModel
    @State var jadwal : JadwalType
    
    var judul : String = "Kemoterapi"
    
    var dateFormatterDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
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
        
        HStack
            {
                VStack
                    {
                        Text("\(self.jadwal.tanggal, formatter: self.dateFormatterDate)") .font(.system(size: 27)) .fontWeight(.bold)
                        
                        Text("\(self.jadwal.tanggal, formatter: self.dateFormatterMonth)") .font(.system(size: 14)) .foregroundColor(.gray) .fontWeight(.semibold)
                        
                        Text("\(self.jadwal.tanggal, formatter: self.dateFormatterYear)") .font(.system(size: 18)) .fontWeight(.bold)
                }.padding(.vertical).padding(.leading)
                
                VStack (alignment: .leading)
                {
                    Text(self.judul).fontWeight(.semibold) .font(.headline).padding(.bottom, 4)
                    Text("\(self.jadwal.tempat)" + " | " + "\(self.jadwal.dokter)") .fontWeight(.medium) .font(.footnote) .foregroundColor(.gray)
                        .padding(.bottom, 4)
                }.padding(.leading, 12).padding(.vertical)
                
                Spacer()
        }.background(Rectangle().foregroundColor(.white)).padding(.bottom,10)
        
        
        
        
        
        
    }
}

struct CardRiwayat_Previews: PreviewProvider {
    static var previews: some View {
        CardRiwayat( jadwalModel: JadwalModel(), jadwal: JadwalType(id: StaticModel.id, name: "", tempat: "", tanggal: Date(), dokter: "String", catatan: ""))
    }
}
