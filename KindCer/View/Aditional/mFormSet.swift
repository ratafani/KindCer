//
//  mFormSet.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI


struct formLargeSize: View{
    
    @State var title = ""
    @State var status = ""
    @State var icon = ""
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    HStack{
                        setImage(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                                .bold()
                                .padding(.bottom, 10)
                                .font(.system(size: 18))
                            Text(status.isEmpty ? "Tidak ada Catatan":status)
                                .opacity(0.5)
                                .font(.system(size: 15))
                                .padding(.bottom, 5)
                        }.padding(.trailing, 8)
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}

struct formLargeSizePath: View{
    
    @State var title1 = ""
    @State var title2 = ""
    @Binding var status : String
    @State var icon = ""
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
//                VStack {
                    HStack{
                        setImage(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            HStack{
                                Text(title1)
                                    .bold()
                                    .padding(.bottom, 10)
                                    .font(.system(size: 18))
                                Text(title2)
                                    .bold()
                                    .padding(.bottom, 10)
                                    .font(.system(size: 18))
                                    .offset(x: -4)
                            }
                            Text(status)
                                .opacity(0.5)
                                .font(.system(size: 15))
//                                .padding(.bottom, 5)
                        }.padding(.trailing, 8)
                        Spacer()
                        Image("Path").padding(.trailing)
                    }
//                }.offset(y: -40)
            }
        }
    }
}

struct formLargeSizePathFixedTop: View{
    
    @State var title1 = ""
    @State var title2 = ""
    @State var status = ""
    @State var icon = ""
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View{
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    HStack{
                        setImage(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            HStack{
                                Text(title1)
                                    .bold()
                                    .padding(.bottom, 10)
                                    .font(.system(size: 18))
                                Text(title2)
                                    .bold()
                                    .padding(.bottom, 10)
                                    .font(.system(size: 18))
                                    .offset(x: -4)
                            }
                            Text(status)
                                .opacity(0.5)
                                .font(.system(size: 15))
//                                .padding(.bottom, 5)
                        }.padding(.trailing, 8)
                        Spacer()
                        Image("Path").padding(.trailing)
                    }
                    Spacer()
                }.padding(.vertical)//.offset(y: -40)
            }
        }
    }
}


struct formLargeSizeTextField: View{
    
    @State var title = ""
    @State var status = ""
    @State var icon = ""
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    @Binding var textField : String
    
    var body: some View{
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    HStack{
                        setImage(icon: icon, width: width, height: height, alignment: .leading).padding(.horizontal, 20)
                        VStack(alignment: .leading){
                            Text(title)
                                .bold()
                                .padding(.bottom, 10)
                                .font(.system(size: 18))
                            TextField("Tulis di sini", text: $textField) .font(.system(size: 15))
                        }
                        Spacer()
                        //Image("Path").padding(.trailing)
                    }
                }.offset(y: -40)
            }
        }
    }
}



struct setImage: View {
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
//
//struct mFormSet_Previews: PreviewProvider {
//    static var previews: some View {
//        mFormSet()
//    }
//}
