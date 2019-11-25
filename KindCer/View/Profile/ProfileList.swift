//
//  ProfileList.swift
//  test1
//
//  Created by Mauldy Putra on 11/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct ProfileList: View {
    var body: some View {
//        ProfileListEmpty()
        ProfileListNotEmpty()
    }
}

struct ProfileListEmpty: View{
    var body: some View{
        ZStack{
//            Spacer()
            Rectangle().frame(width: 382, height: 586).foregroundColor(.white).cornerRadius(5)
            VStack {
                Spacer()
                Image("kuat")
                Text("Tambahkan Treatment").bold().font(.system(size: 22))
                Text("Kumpulkan catatan tindakan treatment kanker kamu sekarang disini.").multilineTextAlignment(.center).lineLimit(2).padding()
                Spacer()
                Button(action: {
                    
                }) {
                    ZStack {
                        Rectangle().foregroundColor(Color("Primary")).frame(width: 250,height: 40).cornerRadius(10)
                        Text("Tambahkan Sekarang").foregroundColor(Color.white)
                    }
                }
//                mButton(buttonContent: "Tambahkan Sekarang").padding(.bottom)
            }
//            Spacer()
        }
    }
}

struct ProfileListNotEmpty: View{
    
    @State var title = "1213"
    @State var status = "12412"
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                    Rectangle().frame(width: 414, height: 89)
                        .foregroundColor(.white)
                    HStack{
                        profileIc(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                            .bold()
                                .padding(.bottom, 10)
                                .font(.system(size: 18))
                            Text(status)
                                .opacity(0.5)
                            .font(.system(size: 15))
                        }
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
            }
//            Spacer()
        }//.edgesIgnoringSafeArea(.all)
    }
}

struct ProfileListNotEmptyLarge: View{
    
    @State var title = "1213"
    @State var status = "12412"
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                    Rectangle().frame(width: 414, height: 170)
                        .foregroundColor(.white)
                VStack {
                    HStack{
                        profileIc(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                                .bold()
                                .padding(.bottom, 10)
                            .font(.system(size: 18))
                            Text(status)
                                .opacity(0.5)
                            .font(.system(size: 15))
                        }
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}

struct ProfileListNotEmptyLargePath: View{
    
    @State var title = "1213"
    @State var status = "12412"
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                    Rectangle().frame(width: 414, height: 170)
                        .foregroundColor(.white)
                VStack {
                    HStack{
                        profileIc(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                                .bold()
                                .padding(.bottom, 10)
                            .font(.system(size: 18))
                            Text(status)
                                .opacity(0.5)
                            .font(.system(size: 15))
                        }
                        Spacer()
                        Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}

struct ProfileListNotEmptyLargeDone: View{
    
    @State var title = "1213"
    @State var icon = "124121"
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                    Rectangle().frame(width: 414, height: 170)
                        .foregroundColor(.white)
                VStack {
                    HStack{
                        profileIc(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                                .bold()
                                .padding(.bottom, 10)
                            .font(.system(size: 18))
                            Text("Kondisi").bold().font(.system(size: 15)).padding(.bottom, 10)
                            Text("ngambil dari sebelumnya").padding(.init(top: 0, leading: 0, bottom: 20, trailing: 0)).font(.system(size: 13))
                            Text("Gejala").bold()
                                .padding(.bottom, 10)
                            .font(.system(size: 18))
                            HStack{
                                Text("sebelumnya").font(.system(size: 13))
                                Text("sebelumnya").font(.system(size: 13))
                                Text("sebelumnya").font(.system(size: 13))
                            }.padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                            Text("Saran").bold()
                                .padding(.bottom, 10)
                            .font(.system(size: 18))
                            Text("Selanjutnya bisa melanjutkan vaksin kedua setelah selesai kemo berikutnya serta kurangi aktivitas padat selama proses kemoterapi. Kemoterapi selanjutnya tanggal 17 Desember 2019.").font(.system(size: 13))
                        }
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}

struct profileIc: View {
    var icon: String
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment
    
    var body: some View{
        Image(icon)
        .resizable()
        .frame(width: width, height: height)
    }
}

struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList()
    }
}
