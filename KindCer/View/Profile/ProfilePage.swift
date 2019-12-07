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
    
    @State var isEmpty = true
    @State var isSheet = false
    @State var userName = ""
    @State var sheetType = 0
    @State var image : UIImage? = UIImage()
    @State var jItem : JadwalType = JadwalType(id: StaticModel.id, tempat: "", tanggal: Date(), dokter: "", catatan: "")
    @State var arr : [CancerUserType] = []
    var body: some View {
        VStack{
            
            
            VStack{
                ZStack {
                    if(userModel.photo.isEmpty){
                        Rectangle().foregroundColor(Color("Primary"))
                        
                    }else{
                        
                        Image(uiImage: UIImage(data: self.userModel.photo) ?? UIImage())
                            .resizable()
                            .frame(height:280)
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
                                self.sheetType = 0
                            }) {
                                Text("Ubah").foregroundColor(.white).padding(5)
                                    .overlay(Rectangle().stroke(Color.white, lineWidth: 4).cornerRadius(5))
                            }.padding(16)
                            Spacer()
                        }
                        
                    }
                    VStack{
                        Rectangle().frame(width: 60, height: 5).foregroundColor(.white).opacity(0.5).cornerRadius(10).padding(5)
                        Spacer()
                    }
                    
                }.frame(height: 280)
                
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
                if typeModel.mData.isEmpty{
                    Spacer()
                    Image("EmptyRecord").resizable().frame(width: 150, height: 150).padding(.bottom)
                    Text("Masih Kosong").bold().font(.headline).padding(.bottom)
                    Text("Summary baru bisa dilihat jika kamu sudah menambahkan catatan symptomps kamu.").multilineTextAlignment(.center).font(.subheadline).frame(width: 250)
                    Spacer()
                    HStack{
                        Text("Tambahkan disini").font(.system(size: 25)).bold().padding(.leading,40)
                        Spacer()
                        Button(action: {
                            self.sheetType = 1
                            self.isSheet = true
                        }) {
                            Text("Tambah").foregroundColor(Color.white).padding(.vertical,10).padding(.horizontal).background(Rectangle().foregroundColor(Color("Primary")).cornerRadius(10))
                            
                        }.padding(.trailing,40)
                    }.frame(height:100).background(Color.white)
                }else{
                    ScrollView{
                        VStack{
                            ForEach(typeModel.mData, id: \.id){ data in
                                cancerTypeView(cancer: data)
                            }
                        }
                    }
                }
            }
            
            //        }
        }.sheet(isPresented: $isSheet) {
            if self.sheetType == 0{

                ProfileEdit(userModel: self.userModel, theName: self.userModel.user_name, img: UIImage(data: self.userModel.photo) ?? UIImage(), goback: self.$isSheet)
            } else{
                ProfileAddCType(typeModel: self.typeModel)
            }
        }.background(Color("inActive")).edgesIgnoringSafeArea(.all)
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
