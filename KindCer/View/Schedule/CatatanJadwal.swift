//
//  CatatanJadwal.swift
//  KindCer
//
//  Created by Rizky Adipratama Ruddyar on 06/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct CatatanJadwal: View {
    
    @State var saranDokter : String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack
                {
                    ZStack{
                                    Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                                    VStack{
                                        Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                                        
                                        
                                        Text("Catatan Jadwal").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                                        
                                        ZStack{
                                            HStack {
                                                Spacer()
                                                Button("Simpan"){
                                                }.foregroundColor(.white).padding(.init(top: -21, leading: 0, bottom: 0, trailing: 15))
                                            }
                                        }
                                        
                                        
                                    }
                                }
                    
                    ZStack(alignment: .topLeading)
                        {
                            Rectangle().foregroundColor(.white).frame(height: geometry.frame(in: .global).height/4)
                            
                            VStack(alignment: .leading)
                            {
                                Text("Saran Dokter") .fontWeight(.semibold)
                                
                                TextField("Tulis saran doktermu di sini", text: self.$saranDokter)
                            }.padding()
            }
                    
                    ZStack(alignment: .topLeading)
                        {
                            Rectangle().foregroundColor(.white).frame(height: geometry.frame(in: .global).height/7)
                            
                            VStack(alignment: .leading)
                            {
                                Text("Tambah Foto Pendukung") .fontWeight(.semibold)
                                Rectangle().foregroundColor(.gray).frame(width: geometry.frame(in: .global).height/14, height: geometry.frame(in: .global).height/14)
                            }.padding()
            }
                    
            Spacer()

                
           
        }
                        
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9468348622, green: 0.936796844, blue: 0.9499147534, alpha: 1)))).edgesIgnoringSafeArea(.all)

}
}

struct CatatanJadwal_Previews: PreviewProvider {
    static var previews: some View {
        CatatanJadwal()
    }
}
