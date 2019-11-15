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
    @Binding var name : String
    var body: some View {
        VStack {
            ZStack{
                Rectangle().foregroundColor(Color("Primary"))
                                    .frame(width: 414, height: 289)
                HStack{
                    Spacer()
                    VStack{
                        
                        profilePic(width: width, height: height)
                        Text(name).foregroundColor(.white).bold().font(.system(size: 24))
                        
                    }.offset(y:30)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            
                        }) {
                            Image("edit").renderingMode(.original).offset(y:-50).padding()
                        }
                    }
                }
            }
        }//.edgesIgnoringSafeArea(.all)
    }
}

struct ProfileCardStatusEmpty: View{
    var body: some View{
        ZStack{
            Rectangle().frame(width: 382, height: 217).foregroundColor(.white).cornerRadius(10)
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
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 382, height: 200).foregroundColor(.white).cornerRadius(10)
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
                            Text("17 Desember 2019").foregroundColor(.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold()
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
                    Text("RS Bunda Menteng").foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 13))
                    Spacer()
                    Divider().padding(.init(top: -24, leading: 0, bottom: 0, trailing: 30))
                    Image("doctorDarkerPurple").padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                    Text("Dr. Ivan Sini").foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).bold().offset(y: -3).font(.system(size: 13))
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
        Image("photo")
            .resizable().scaledToFill()
            .frame(width: width, height: height)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .clipShape(Ellipse())
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardStatus()
    }
}