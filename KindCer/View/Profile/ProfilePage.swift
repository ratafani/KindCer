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
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack {
                    ProfileCardHeader(isSheet: $isSheet, sheetType: $sheetType, image: $image, userModel: userModel).padding(.init(top: -43.8, leading: 0, bottom: 0, trailing: 0))
                    HStack {
                        
                        VStack {
                            Button(action: {
                                self.isSheet = true
                                self.sheetType = 2
                            }) {
                                Image("edit").renderingMode(.original).offset(x:50,y:50).padding(40)
                            }
                        }
                    }
                }
                //            ProfileCardStatus()
                HStack{
                    Text("Jadwal Kemoterapi").bold().font(.system(size: 20)).padding(.horizontal)
                    Spacer()
                    Button("Tambah"){
                        self.isSheet = true
                        self.sheetType = 1
                    }.foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).padding(.horizontal)
                }
                
                if jadwal.data.isEmpty {
                    ProfileCardStatusEmpty()
                    
                }else{
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(jadwal.data, id: \.id){ theData in
                                ProfileCardStatus(jadwal: theData)
                            }
                        }
                    }.padding(.leading)
                }
                HStack{
                    Text("Bio saya").bold().font(.system(size: 20)).padding(.horizontal)
                    Spacer()
                    Button("Ubah"){
                        self.isSheet = true
                        self.sheetType = 0
                    }.foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).padding(.horizontal)
                }.padding(.init(top: 10, leading: 0, bottom: 5, trailing: 0))
                ProfileCancerDetailView(userModel: userModel)
                
//                ProfileConditionDetail(userModel: userModel)
                Spacer()
                //            ProfileListEmpty().offset(y:-30)
            }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all)).sheet( isPresented: $isSheet) {
                if self.sheetType == 0{
                    ProfileBioAdd(mUser: self.userModel, showingModal: self.$isSheet)
                } else if self.sheetType == 1{
                    SchedulePage(isSheet: self.$isSheet, jadwal: self.jadwal)
                }else {
                    ImagePicker(isShown: self.$isSheet, uiImage: self.$image,userModel: self.userModel)
                }
                //            ProfileBioAdd(mUser: self.userModel, showingModal: self.$isSheet)
            }
        }.onAppear{
            print(self.userModel.kondisi)
            //            self.userName = self.mUser.isEmpty ? "" : self.mUser[0].user_name ?? ""
        }
        //        }
    }
}

struct profilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(userModel: UserModel(), jadwal: JadwalModel())
    }
}
