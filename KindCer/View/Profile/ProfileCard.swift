//
//  ProfileCard.swift
//  test1
//
//  Created by Mauldy Putra on 11/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        ProfileCardStatus()
    }
}

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
                    .frame( height: 289)
                HStack{
                    Spacer()
                    VStack{
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
                        Text(userModel.user_name ?? "User").foregroundColor(.white).bold().font(.system(size: 24))
                        
                    }.offset(y:30)
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
            Rectangle().frame( height: 217).foregroundColor(.white).cornerRadius(10)
            VStack{
                
                Image("EmptyRecord").resizable().frame(width: 103.75, height: 102)
                Text("Tambahkan Treatment").bold().font(.system(size: 16)).padding(.horizontal)
                Text("Kumpulkan jadwal kemoterapi anda disini.").multilineTextAlignment(.center).lineLimit(2).font(.system(size: 13)).padding(.bottom)
                //                Spacer()
            }
        }
    }
}

struct ProfileCardStatus: View {
    
    @State var statusTitle = "Chemotherapy"
    @State var mStatus : CGFloat = 250.0
    @State var days : Int = 225
    
    @State var jadwal = JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        ZStack{
            Rectangle().frame( height: 200).foregroundColor(.white).cornerRadius(10)
            VStack{
                
                ZStack{
                    Rectangle().frame(width: 382,height: 50).foregroundColor(Color("Primary")).cornerRadius(10, antialiased: false)
                    HStack {
                        Text("Kemoterapi").font(.system(size: 17)).foregroundColor(.white).bold().padding(.horizontal).offset(x: 18)
                        Spacer()
                    }
                }
                
                //Rectangle dalam card
                ZStack{
                    VStack {
                        HStack {
                            Text("Next treatment:").font(.system(size: 15))
                            //                            Text("\(jadwal.tanggal, formatter: dateFormatter)").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold()
                            Text("\(jadwal.tanggal, formatter: dateFormatter)").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold()
                            Spacer().font(.system(size: 15))
                            Text("52 hari lagi").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1)))
                        }.padding(.horizontal,25).padding(.top,10).font(.system(size: 15))
                        VStack{
                            ZStack(alignment: .leading){
                                Rectangle().frame(width: 350, height: 15).foregroundColor(.init(#colorLiteral(red: 0.9316993356, green: 0.9261607528, blue: 0.9359568357, alpha: 1))).cornerRadius(10)
                                Rectangle().frame(width: mStatus, height: 15).foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).cornerRadius(10)
                            }//.padding(.bottom)
                        }
                        //                    Spacer()
                    }.padding(.bottom, 20)
                }
                Divider().padding(.horizontal)
                
                //Icon hospital
                HStack{
                    Image("hospitalDarkerPurple").padding(.init(top: 0, leading: 30, bottom: 10, trailing: 0))
                    Text("\(jadwal.tempat)").foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 13))
                    Spacer()
                    Divider().padding(.init(top: -24, leading: 0, bottom: 0, trailing: 30))
                    Image("doctorDarkerPurple").padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                    Text("\(jadwal.dokter)").foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 13))
                    Spacer()
                }.padding()
            }
        }
        
    }
}

struct profilePic: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View{
        Image("photo1")
            .resizable()
            .frame(width: width, height: height)
            .scaledToFill().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5)
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardStatus()
    }
}
