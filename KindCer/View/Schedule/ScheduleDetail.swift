//
//  ScheduleDetail.swift
//  KindCer
//
//  Created by Mauldy Putra on 04/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ScheduleDetail: View {
    
    @State var jadwal = JadwalType(id: StaticModel.id, name: "", tempat: "", tanggal: Date(), dokter: "", catatan: "")
//        JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                VStack{
                    Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                    Text("Detail Jadwal").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                    ZStack{
                        HStack {
                            Spacer()
                            Button("Ubah"){
                                //                                self.addToCD()
                                //                                self.isSheet =  false
                            }.foregroundColor(.white).padding(.init(top: -21, leading: 0, bottom: 0, trailing: 15))
                        }
                    }
                }
            }
            //            HStack {
            //                Text("Kemo selanjutnya: ").padding(.leading).font(.system(size: 15))
            //                Spacer()
            //            }
            jadwalBarDetail(jadwal: $jadwal)
            jadwalDetailBtmDetail(jadwal: $jadwal).padding(.init(top: -10, leading: 0, bottom: 0, trailing: 0))
            ZStack{
                Rectangle().frame(width: 414).foregroundColor(.white)
                VStack{
                    HStack {
                        Text("Catatan").bold().padding().font(.system(size: 17))
                        Spacer()
                    }
                    HStack {
                        Text("Saran Dokter").bold().padding(.leading).font(.system(size: 15))
                        Spacer()
                    }
                    HStack {
                        Text("tes\(jadwal.catatan)").padding(.init(top: 11, leading: 17, bottom: 11, trailing: 17)).font(.system(size: 13)).multilineTextAlignment(.leading)
                        Spacer()
                    }
                    HStack {
                        Text("Foto Pendukung").bold().padding(.leading).font(.system(size: 15))
                        Spacer()
                    }
                }.offset(y: -95)
            }
            Spacer()
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9468348622, green: 0.936796844, blue: 0.9499147534, alpha: 1)))).edgesIgnoringSafeArea(.all)
    }
}

struct jadwalBarDetail: View{
    
    @Binding var jadwal : JadwalType
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    var body: some View{
        ZStack{
            Rectangle().frame(width: 414, height: 120).foregroundColor(.white).offset(y: -8)//.padding(.init(top: -8, leading: 0, bottom: 0, trailing: 0 ))
            VStack {
                HStack {
                    Text("Kemo selanjutnya: ").padding(.leading).font(.system(size: 15))
                    Spacer()
                }
                HStack {
                    Text("\(jadwal.tanggal, formatter: dateFormatter)").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().font(.system(size: 21))
                    Spacer()
                    Text("\(countingDays()) hari lagi").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).font(.system(size: 15))
                }.padding(.horizontal).padding(.top,10)
                VStack{
                    ZStack(alignment: .leading){
                        Rectangle().frame(width: 350, height: 15).foregroundColor(.init(#colorLiteral(red: 0.9316993356, green: 0.9261607528, blue: 0.9359568357, alpha: 1))).cornerRadius(10)
                        Rectangle().frame(width: calBar(), height: 15).foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).cornerRadius(10).onAppear{
                            
                        }
                    }//.padding(.bottom)
                }
                //                    Spacer()
            }.padding(.bottom, 20)
        }
    }
    
    func countingDays()->Int{
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.day], from: Date(), to: self.jadwal.tanggal)
        return components.day ?? 0
    }
    func calBar()->CGFloat{
        let days = countingDays()
        var mStatus:CGFloat = 350.0
        if days < 30{
            for _ in 0...(30-days){
                mStatus -= 350/30
            }
        }
        return mStatus
    }
}
struct jadwalDetailBtmDetail:View {
    @Binding var jadwal : JadwalType
    var body: some View{
        HStack{
            ZStack{
                Rectangle().frame(width: 207,height: 72).foregroundColor(.white)
                HStack{
                    Image("Stethoscope")//.padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("Nama Dokter").font(.system(size: 14)).padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                        Text(jadwal.dokter).bold().offset(y: -3).font(.system(size: 15))
                        
                    }
                }
            }
//            Spacer()
            ZStack{
                Rectangle().frame(width: 207 ,height: 72).foregroundColor(.white).offset(x: -5)
                HStack{
                    Image("hospitalWhite")//.padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("Tempat").font(.system(size: 14)).padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                        Text(jadwal.tempat).bold().offset(y: -3).font(.system(size: 15))
                    }
                }
            }
        }
        //        ZStack{
        //            Rectangle().foregroundColor(.white).frame(width: 414, height: 72).offset(y: -26)//.padding(.init(top: -40, leading: 0, bottom: 0, trailing: 0))
        //            HStack{
        //                Image("Stethoscope").offset(y: -26)//.padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
        //                VStack{
        //                    Text("Nama Dokter").font(.system(size: 14))
        //                    Text(jadwal.dokter).foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 15))
        //                }.offset(y: -26)
        //                Spacer()
        ////                Divider().padding(.init(top: -30, leading: 0, bottom: 0, trailing: 30)).frame(width: 2, height: 72)
        //                Image("hospitalWhite").offset(y: -26)//.padding(.init(top: 0, leading: 30, bottom: 10, trailing: 0))
        //                VStack{
        //                    Text("Tempat").font(.system(size: 14))
        //                    Text(jadwal.tempat).foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 15))
        //                }.offset(y: -26)
        //                Spacer()
        //            }.padding()
        //        }
    }
}

struct ScheduleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleDetail()
    }
}
