//
//  profilePage.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    
    // hex color ungu literal = 8551D6
    @ObservedObject var userModel: UserModel
    @ObservedObject var jadwal : JadwalModel
    
    @State var isEmpty = true
    @State var isSheet = false
    @State var userName = ""
    @State var sheetType = 0
    @State var image : UIImage? = UIImage()
    @State var jItem : JadwalType = JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    @State var arr : [String] = ["as"]
    var body: some View {
        VStack{
            ZStack{
                Rectangle().frame(height: 50).foregroundColor(Color("Primary"))
                Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10).padding(.init(top: 10, leading: 0, bottom: 20, trailing: 0))
            }.padding(.init(top: 0, leading: 0, bottom: -30, trailing: 0))
            
                VStack{
                    ZStack {
                        Rectangle().foregroundColor(Color("Primary"))
                        
                        HStack {
                            Spacer()
                            VStack {
                                Button(action: {
                                    self.isSheet = true
//                                    self.sheetType = 2
                                    
                                }) {
                                    Text("Ubah").foregroundColor(.white).padding(4)
                                        .background(Rectangle().stroke(Color.white, lineWidth: 4).cornerRadius(5))
                                }.padding(16)
                                Spacer()
                            }
                        }
                        VStack{
                            if(userModel.photo.isEmpty){

                                Image("photo1")
                                    .resizable()
                                    .frame(width: 112, height: 112)
                                    .scaledToFill()
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))

                            }else{

                                Image(uiImage: UIImage(data: self.userModel.photo) ?? UIImage())
                                    .resizable()
                                    .frame(width: 112, height: 112)
                                    .scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5)
                            }
                            Text(userModel.user_name == "" ? "Belum ada nama":userModel.user_name).font(.headline).foregroundColor(.white).bold()
                        }
                    }.frame(height: 216)
                    
                    HStack{
                        Text("Tambahkan Jenis Kanker").font(.headline).bold().padding(16)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Tambah").foregroundColor(Color("Primary"))
                                
                        }.padding(16)
                    }
                    if arr.isEmpty{
                        Spacer()
                        Image("EmptyRecord").padding(.bottom)
                        Text("Masih Kosong").bold().font(.headline).padding(.bottom)
                        Text("Summary baru bisa dilihat jika kamu sudah menambahkan catatan symptomps kamu.").multilineTextAlignment(.center).font(.subheadline).frame(width: 200)
                        Spacer()
                    }else{
                        List{
                            Text("asdas")
                            Text("asdas")
                            Text("asdas")
                        }
                    }
                }
            
            //        }
        }.sheet(isPresented: $isSheet) {
            ProfileEdit(userModel: self.userModel, theName: self.userModel.user_name, img: UIImage(data: self.userModel.photo) ?? UIImage(), goback: self.$isSheet)
        }
    }
    
}

struct profilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(userModel: UserModel(), jadwal: JadwalModel())
    }
}
