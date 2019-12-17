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
    @ObservedObject var typeModel : CancerModel = CancerModel()
    @State var selectedType : CancerUserType = CancerUserType(id: StaticModel.id, name: "", tanngal: Date())
    
    @State var isEmpty = true
    @State var isSheet = false
    @State var userName = ""
    @State var sheetType = 0
    @State var image : UIImage? = UIImage()
    @State var jItem : JadwalType = JadwalType(id: StaticModel.id, name: "", tempat: "", tanggal: Date(), dokter: "", catatan: "")
    @State var arr : [CancerUserType] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geometry in
             VStack{
                        
                        VStack{
                            ZStack{
                                if(self.userModel.photo.isEmpty){
                                    Rectangle().foregroundColor(Color("Primary"))
                                    .frame(height:geometry.frame(in: .global).height/3)
                                    
                                }else{
                                    
                                    Image(uiImage: UIImage(data: self.userModel.photo) ?? UIImage())
                                        .resizable()
                                        .frame(height:geometry.frame(in: .global).height/3)
                                        .scaledToFit()
                                        .blur(radius: 5)
                                        .overlay(Rectangle().foregroundColor(.black).opacity(0.3))
                                }
                                
                                
                                VStack{
                                    ZStack
                                        {
                                            if(self.userModel.photo.isEmpty){
                                        
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
                                            Button(action: {
                                                          self.isSheet = true
                                                        self.sheetType = 0
                                                       }) {
                                                           Image("edit").renderingMode(.original).offset(x:35,y:38).padding(40).shadow(color: Color("Primary"), radius: 2)
                                                       }
                                    }
                                    Text(self.userModel.user_name == "" ? "Belum ada nama":self.userModel.user_name).font(.system(size: 24)).foregroundColor(.white).bold().gesture(TapGesture().onEnded({
                                        self.isSheet = true
                                        self.sheetType = 0
                                        print("tapped")
                                    }))
                                }
                                HStack {
                                    VStack {
                                        Button(action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }) {
                                            Image(systemName: "xmark.circle.fill").resizable().buttonStyle(PlainButtonStyle()).foregroundColor(.white) .frame(width: geometry.frame(in: .global).height/30 ,height: geometry.frame(in: .global).height/30)
                                        }.padding(16)
                                        Spacer()
                                    }
                                    Spacer()
            //                        VStack {
            //                            Button(action: {
            //                                self.isSheet = true
            //                                self.sheetType = 0
            //                            }) {
            //                                Text("Ubah").bold().foregroundColor(Color("Primary")).padding(5)
            //                                    .background(Rectangle().foregroundColor(Color.white).cornerRadius(5))
            //                            }.padding(16)
            //                            Spacer()
            //                        }
                                    
                                }
                                VStack{
                                    Rectangle().frame(width: 60, height: 5).foregroundColor(.white).opacity(0.5).cornerRadius(10).padding(10)
                                    Spacer()
                                }
                                
                            }.frame(height:geometry.frame(in: .global).height/3)
                            
                            HStack{
                                Text("Tambahkan Jenis Kanker").font(.headline).bold().padding(16)
                                Spacer()
                                Button(action: {

                                    self.sheetType = 1
                                    self.isSheet = true
                                }) {
                                    Text("Tambah").foregroundColor(Color("Primary")).bold()

                                }.padding(16)
                            }
                            if self.typeModel.mData.isEmpty{
            //                    Spacer()
            //                    Image("EmptyRecord").resizable().frame(width: 150, height: 150).padding(.bottom)
            //                    Text("Masih Kosong").bold().font(.headline).padding(.bottom)
            //                    Text("Mulai lengkapi kondisi terkini kamu sekarang.").multilineTextAlignment(.center).font(.subheadline).frame(width: 250)
            //                    Spacer()
                                
                                ZStack {
                                       Rectangle().foregroundColor(.clear)
                                        //.frame(height: geometry.frame(in: .global).height/2)
                                       VStack {
                                           Image("EmptyRecord").resizable().foregroundColor(Color("Primary")).frame(width: 168, height: 157).padding(.top)
                                           Text("Masih Kosong").foregroundColor(Color.init(#colorLiteral(red: 0.5215227604, green: 0.3181272149, blue: 0.8401996493, alpha: 1))).bold().padding(.top,20)
                                           Text("Mulai lengkapi kondisi terkini kamu sekarang").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)
                                            .frame(width: geometry.frame(in:.global).width / 1.3, height: geometry.frame(in:.global).height/12)
                                           Button(action: {
                                                self.sheetType = 1
                                                self.isSheet = true
                                           }) {
                                               ZStack {
                                                   Rectangle().foregroundColor(Color("Primary")).frame(width: 300,height: 50).cornerRadius(15)
                                                   Text("Tambahkan Kondisi").foregroundColor(Color.white)
                                               }
                                           }
                                       }.padding()
                                   }

                                
            //                    HStack{
            //                        Text("Tambahkan disini").font(.system(size: 25)).bold().padding(.leading,40)
            //                        Spacer()
            //                        Button(action: {
            //                            self.sheetType = 1
            //                            self.isSheet = true
            //                        }) {
            //                            Text("Tambah").foregroundColor(Color.white).padding(.vertical,10).padding(.horizontal).background(Rectangle().foregroundColor(Color("Primary")).cornerRadius(10))
            //
            //                        }.padding(.trailing,40)
            //                    }.frame(height:100).background(Color.white)
                            }else{
                                ScrollView{
                                    VStack{
                                        ForEach(self.typeModel.mData, id: \.id){ data in
                                            cancerTypeView(cancer: data).onTapGesture {
                                                self.isSheet = true
                                                self.selectedType = data
                                                self.sheetType = 2
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        //        }
             }.sheet(isPresented: self.$isSheet) {
                        if self.sheetType == 0{

                            ProfileEdit(userModel: self.userModel, theName: self.userModel.user_name, img: UIImage(data: self.userModel.photo) ?? UIImage(), goback: self.$isSheet)
                        } else if self.sheetType == 1{
                            ProfileAddCType(typeModel: self.typeModel)
                        }else{
                            ProfileEditCType(typeModel: self.typeModel, cancer: self.selectedType)
                        }
                    }.background(Color("inActive")).edgesIgnoringSafeArea(.all)
        }
    }
    
}

struct cancerTypeView:View{
    @State var cancer: CancerUserType
    var body:some View{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY"
        return HStack{
            Spacer()
            VStack{
                Text("Jenis Kanker").bold().padding(.bottom)
                Text(cancer.name).foregroundColor(.gray)
            }.frame( height: 100)
            Spacer()
            Rectangle().frame(width:1, height: 60).foregroundColor(.gray).opacity(0.6)
            Spacer()
            VStack{
                Text("Tanggal Diagnosis").bold().padding(.bottom)
                Text("\(dateFormatter.string(from: cancer.tanngal))").foregroundColor(.gray)
            }.frame( height: 100)
            Spacer()
            }.background(Color.white)
    }
}

struct CardProfileEmpty: View {
    @State var sheetType = 0
    @State var isSheet : Bool = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                   Rectangle().foregroundColor(.clear)
                    //.frame(height: geometry.frame(in: .global).height/2)
                   VStack {
                       Image("EmptyRecord").resizable().foregroundColor(Color("Primary")).frame(width: 168, height: 157).padding(.top)
                       Text("Masih Kosong").foregroundColor(Color.init(#colorLiteral(red: 0.5215227604, green: 0.3181272149, blue: 0.8401996493, alpha: 1))).bold().padding(.top,20)
                       Text("Mulai lengkapi kondisi terkini kamu sekarang").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)
                       Button(action: {

                       }) {
                           ZStack {
                               Rectangle().foregroundColor(Color("Primary")).frame(width: 300,height: 50).cornerRadius(15)
                               Text("Tambahkan Kondisi").foregroundColor(Color.white)
                           } .padding(.top, 20)
                       }
                   }.padding()
               }
            
        }
    }
}

class CustomPrintPageRenderer: UIPrintPageRenderer {
    let A4PageWidth: CGFloat = 595.2
    let A4PageHeight: CGFloat = 841.8
    override init() {
        super.init()
        let pageFrame = CGRect(x: 0, y: 0, width: A4PageWidth , height: A4PageHeight )
        self.setValue(pageFrame, forKey: "paperRect")
        self.setValue(CGRect(x: 0, y: 0, width: A4PageWidth , height: A4PageHeight - 50), forKey: "printableRect")
        self.footerHeight = 50.0
        self.headerHeight = 50.0
    }
}
struct profilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(userModel: UserModel(), jadwal: JadwalModel())
    }
}
