//
//  ProfileCard.swift
//  test1
//
//  Created by Mauldy Putra on 11/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

//struct ProfileCard: View {
//    var body: some View {
//        ProfileCardStatus(jadwalModel: JadwalModel())
//    }
//}

struct ProfileCardHeader: View {
    
    @State var width: CGFloat = 150
    @State var height: CGFloat = 150
    @State var isTapped: Bool = false
    @Binding var isSheet : Bool
    @Binding var sheetType :Int
    @Binding var image : UIImage?
    @ObservedObject var userModel : UserModel
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle().foregroundColor(Color("Primary"))
                    .frame( height: 250)
                HStack{
                    Spacer()
                    VStack{
//                        Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10).padding(.init(top: 10, leading: 0, bottom: 20, trailing: 0))
                        if(userModel.photo.isEmpty){

                            Image("photo1")
                                .resizable()
                                .frame(width: width, height: height)

                            .scaledToFill().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5)

                        }else{

                            Image(uiImage: UIImage(data: self.userModel.photo) ?? UIImage())
                                .resizable()
                                .frame(width: width, height: height)
                                .scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5)
                        }
                        Text(userModel.user_name.isEmpty ? "Belum ada nama":userModel.user_name).foregroundColor(.white).bold().font(.system(size: 24)).padding(.bottom, 10).offset(y: 5)
                        
                    }.offset(y:0)
                    Spacer()
                }
                
            }
        }//.edgesIgnoringSafeArea(.all)
            .onAppear{
                self.image = UIImage(data: self.userModel.photo) ?? UIImage()
        }
    }
}

struct ProfileCardStatusEmpty: View{
    var body: some View{
        ZStack{
            Rectangle().frame( width:400,height: 217).foregroundColor(.white).cornerRadius(10)
            VStack{
                
                Image("EmptyRecord").resizable().frame(width: 103.75, height: 102)
                Text("Tambahkan Treatment").bold().font(.system(size: 16)).padding(.horizontal)
                Text("Kumpulkan jadwal kemoterapi kamu disini.").multilineTextAlignment(.center).lineLimit(2).font(.system(size: 13)).padding(.bottom)
                //                Spacer()
            }
        }
    }
}

struct ProfileCardStatus: View {
    
    @State var statusTitle = "Chemotherapy"
    @State var mStatus : CGFloat = 350.0
    @State var days : Int = 225
    @ObservedObject var jadwalModel : JadwalModel
    @State var jadwal = JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    @State var isSheet = false
    @Binding var homeSheet : Bool
   
 
    var body: some View {
        ZStack{
            Rectangle().frame( height: 200).foregroundColor(.white).cornerRadius(10)
            VStack{
                
                ZStack{
                    Rectangle().frame(height: 50).foregroundColor(Color("Primary")).cornerRadius(10, antialiased: false)
                    HStack {
                        Text("Kemoterapi").font(.system(size: 17)).foregroundColor(.white).bold().padding(.horizontal).offset(x: 18)
                        Spacer()
                    }
                }
                
                //Rectangle dalam card
                jadwalBar(jadwal: $jadwal)
                Divider().padding(.horizontal)
                jadwalDetailBtm(jadwal: $jadwal)
                //Icon hospital
//                jadwalDetailBtm(jadwal: $jadwal)
            }
        }.sheet(isPresented: $isSheet) {
            SchedulePageEdit(isSheet: self.$isSheet, jItem: self.$jadwal, jadwal: self.jadwalModel)
        }.onTapGesture {
            self.isSheet = true
        }
        
    }
}

struct jadwalBar: View{
    
    @Binding var jadwal : JadwalType
    
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           return formatter
       }
    var body: some View{
        ZStack{
            VStack {
                HStack {
                    Text("Pengobatan Berikutnya:").font(.system(size: 15))
                    //                            Text("\(jadwal.tanggal, formatter: dateFormatter)").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold()
                    Text("\(jadwal.tanggal, formatter: dateFormatter)").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold()
                    Spacer().font(.system(size: 15))
                    Text("\(countingDays()) hari lagi").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1)))
                }.padding(.horizontal,25).padding(.top,10).font(.system(size: 15))
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
        let days = countingDays() + 1
        var mStatus:CGFloat = 350.0
        if days < 30{
            for _ in 0...(29-days){
                mStatus -= 350/30
            }
        }
        return mStatus
    }
}
struct jadwalDetailBtm:View {
    @Binding var jadwal : JadwalType
    var body: some View{
        HStack{
            Image("hospitalDarkerPurple").padding(.init(top: 0, leading: 30, bottom: 10, trailing: 0))
            Text(jadwal.tempat ).foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 13))
            Spacer()
            Divider().padding(.init(top: -15, leading: 0, bottom: 0, trailing: 30))
            Image("doctorDarkerPurple").padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text(jadwal.dokter).foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 13))
            Spacer()
        }.padding()
    }
}
struct profilePic: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View{
        Image("photo1")
            .resizable()
            .aspectRatio(contentMode:.fill)
            .frame(width: width, height: height)
            .overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5)
    }
}

//struct ProfileCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileCardStatus(jadwalModel: JadwalModel())
//    }
//}
