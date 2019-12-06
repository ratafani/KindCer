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
            
            
            VStack{
                ZStack {
                    if(userModel.photo.isEmpty){
                        Rectangle().foregroundColor(Color("Primary"))
                        
                    }else{
                        
                        Image(uiImage: UIImage(data: self.userModel.photo) ?? UIImage())
                            .resizable()
                            .frame(height:240)
                            .scaledToFit()
                            .blur(radius: 5)
                            .overlay(Rectangle().foregroundColor(.black).opacity(0.3))
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
                                .scaledToFill().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5)
                        }
                        Text(userModel.user_name == "" ? "Belum ada nama":userModel.user_name).font(.body).foregroundColor(.white).bold()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                self.isSheet = true
                                
                            }) {
                                Text("Ubah").foregroundColor(.white).padding(5)
                                    .overlay(Rectangle().stroke(Color.white, lineWidth: 4).cornerRadius(5))
                            }.padding(16)
                            Spacer()
                        }
                        
                    }
                }.frame(height: 240)
                
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
