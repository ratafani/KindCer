//
//  ObatDetail.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 06/01/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ObatDetail: View {
    @Binding var obat : ObatType
    @ObservedObject var mObat : ObatModel
    
    @Binding var isDetail : Bool
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    self.isDetail = false
                }) {
                   Image(systemName: "xmark").resizable().foregroundColor(Color("Primary")).frame(width: 20, height: 20)
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    print(Array(self.obat.jadwal))
                }) {
                   Image(systemName: "pencil.circle.fill").resizable().foregroundColor(Color("Primary")).frame(width: 30, height: 30)
                }.buttonStyle(PlainButtonStyle())
            }
            Text(obat.name).bold().font(.system(size: 24))
            HStack{
                Text(obat.aturan).foregroundColor(.gray)
                Divider().frame( height: 15)
                Text("Jenis: \(obat.jenis)").foregroundColor(.gray)
            }
            HStack(spacing:18){
                ForEach(Array(obat.jadwal).indices,id: \.self){ s in
                    VStack {
                        ZStack {
                            Rectangle().frame(width: 50,height: 5).foregroundColor(s+1 != Array(self.obat.jadwal).count ? self.mObat.getData(obat: self.obat.name).count <= s ? Color.gray : Color("Primary") : .white).cornerRadius(10).offset(x: 30)
                            Circle().frame(width: 30, height: 30).foregroundColor(self.fillColor(i: s)).overlay(Circle().stroke(self.mObat.getData(obat: self.obat.name).count <= s ? Color.gray : Color("Primary"),lineWidth: 5))
                        }
                        Text("\(Array(self.obat.jadwal)[s])").font(.system(size: 16)).foregroundColor(Color("Primary")).bold()
                    }
                }
            }.padding()
            //Button
            HStack(spacing: 50){
                VStack{
                    Button(action: {
                        let ad = ObatHistory(id: StaticModel.id, name: self.obat.name, time: Date(), status: "skip")
                        self.mObat.saveRiwayatObat(obat: ad)
                        self.isDetail = false
                    }) {
                        ZStack {
                            Circle().foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            Image(systemName: "xmark").foregroundColor(Color("Primary"))
                        }
                    }.frame(width: 50, height: 50)
                    Text("lewati").foregroundColor(Color("Primary"))
                }
                VStack{
                    Button(action: {
                        let ad = ObatHistory(id: StaticModel.id, name: self.obat.name, time: Date(), status: "drink")
                        self.mObat.saveRiwayatObat(obat: ad)
                        self.isDetail = false
                    }) {
                        ZStack {
                            Circle().foregroundColor(Color("Primary"))
                            Image(systemName: "checkmark").foregroundColor(.white)
                        }
                    }.frame(width: 50, height: 50)
                    Text("Sudah").foregroundColor(Color("Primary"))
                }
                VStack{
                    Button(action: {
                        self.mObat.deleteItem(id: self.obat.id)
                        self.isDetail = false
                    }) {
                        ZStack {
                            Circle().foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            Image(systemName: "trash").foregroundColor(Color("Primary"))
                        }
                    }.frame(width: 50, height: 50)
                    Text("Hapus").foregroundColor(Color("Primary"))
                }
            }
            }.padding().background(Rectangle().foregroundColor(.white).cornerRadius(10)).frame(width: 320)
    }
        
    func fillColor(i : Int)->Color{
        let arr = mObat.getData(obat: obat.name)
        if arr.count <= i{
            return Color.white
        }else if arr[i].status == "skip"{
            return Color.red
        }else if arr[i].status == "drink"{
            return Color.green//Color("Primary")
        }else{
            return Color.white
        }
    }
}

struct ObatDetail_Previews: PreviewProvider {
    static var previews: some View {
        ObatDetail(obat: .constant(ObatType(id: StaticModel.id, name: "", jadwal: ["8 :00","11 :30","18 :00"], jenis: "", aturan: "")), mObat: ObatModel(), isDetail: .constant(true)).padding().background(Color.red)
    }
}
