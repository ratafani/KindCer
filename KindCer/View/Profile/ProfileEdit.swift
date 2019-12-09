//
//  ProfileEdit.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 03/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ProfileEdit: View {
    @ObservedObject var userModel: UserModel = UserModel()
    @State var theName : String = ""
    @State var img : UIImage?
    @State var isSheet : Bool = false
    @State var sheetType : Int = 0
    @State var tgl_lahir : Date = Date()
    @Binding var goback : Bool
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 0, to: Date())!
        return min...max
    }
    
    var body: some View {
        VStack {
            ZStack {
                headerModal(title: "Ubah Profile")
                    .padding(.bottom)
                HStack{
                    Button(action: {
                        self.goback = false
                        
                        
                    }) {
                        Text("Batal").foregroundColor(.white).padding(4)
                        
                    }.padding(16)
                    Spacer()
                    Button(action: {
                        if (self.img != nil){
                            
                            let imageData = self.img!.jpegData(compressionQuality: 1.0)
                            if !(imageData==nil) {
                                self.userModel.updateDataUser(photo: imageData ?? Data(), userName: self.theName, date: self.tgl_lahir)
                                self.goback = false
                            }else{
                                self.userModel.updateDataUser(photo: Data(), userName: self.theName, date: self.tgl_lahir)
                                self.goback = false
                                print("Something error")
                            }
                        }
                        
                    }) {
                        Text("Simpan").foregroundColor(.white).padding(4)
                        
                    }.padding(16)
                }
            }
            ZStack{
                if(img == nil){
                    
                    Image("photo1")
                        .resizable()
                        .frame(width: 112, height: 112)
                        .scaledToFill()
                        .overlay(Circle().stroke(Color("Primary"), lineWidth: 3).shadow(radius: 2))
                        .clipShape(Ellipse())
                    
                    
                }else{
                    
                    Image(uiImage: img ?? UIImage())
                        .resizable()
                        .frame(width: 112, height: 112)
                        .scaledToFit()
                        .overlay(Circle().stroke(Color("Primary"), lineWidth: 3).shadow(radius: 2))
                        .clipShape(Ellipse())
                        .onAppear{
                            self.img =  UIImage(data: self.userModel.photo) ?? UIImage()
                            
                    }
                }
                Button(action: {
                    self.isSheet = true
                    self.sheetType = 0
                }) {
                    Image("edit").renderingMode(.original).offset(x:35,y:38).padding(40).shadow(color: Color("Primary"), radius: 2)
                }
                
            }.padding(.bottom)
            HStack {
                Text("User Name").bold().padding(.leading)
                Spacer()
            }
            TextField("Nama Lengkap", text: $theName).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
            
            HStack {
                Text("Tanggal Lahir").bold().padding(.leading)
                Spacer()
            }
            ZStack{
                Rectangle().foregroundColor(Color.white).frame(height: 270)
                DatePicker(
                    selection: self.$tgl_lahir,
                    in: self.dateClosedRange,
                    displayedComponents: .date,
                    label: { Text("Tanggal Diagnosis").foregroundColor(.clear) .font(.system(size: 15)) .opacity(0.5) }
                ).labelsHidden().onAppear{
                    self.tgl_lahir = self.userModel.tanggal_lahir
                }
            }
            
            Spacer()
            
        }.background(Color(#colorLiteral(red: 0.9725627303, green: 0.9667808414, blue: 0.9770069718, alpha: 1))).sheet(isPresented: $isSheet) {
            ImagePicker(isShown: self.$isSheet, uiImage: self.$img)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ProfileEdit_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileEdit(img: UIImage(), goback: .constant(true))
    }
}
