//
//  ProfileCancerDetailView.swift
//  NewKindcer
//
//  Created by Rizky Adipratama Ruddyar on 11/11/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct ProfileCancerDetailView: View {
    
    @ObservedObject var userModel:UserModel
    var dateFormatter: DateFormatter {
          let formatter = DateFormatter()
        formatter.dateStyle = .medium
          return formatter
      }
    var body: some View {
        
        VStack(alignment: .center, spacing: 2){
            HStack(alignment: .center, spacing: 2){
                ZStack{
                    Rectangle().foregroundColor(.white).cornerRadius(5).padding(2)
                    HStack{
                        Image("cancertype") .resizable()
                            .frame(width: 23, height: 23, alignment: .center).padding(.horizontal,10)
                        VStack(alignment:.leading){
                            Text("Tipe Kanker")
                                .font(.system(size: 14)).foregroundColor(.gray) .padding(.top, 6)

                            Text(userModel.jenis_kanker)
                                .font(.system(size: 15))  .padding(.vertical, 6)
                            
                        }.padding(4)
                        Spacer()
                    }
                }
                ZStack{
                    Rectangle().foregroundColor(.white)
                        .cornerRadius(5).padding(2)
                    HStack{
                        Image("cancersite") .resizable()
                            .frame(width: 15, height: 35, alignment: .center).padding(.horizontal,10)
                        VStack(alignment:.leading){
                            Text("Posisi Kanker")
                                .font(.system(size: 14)).foregroundColor(.gray).padding(.top, 6)

                            Text(userModel.posisi_kanker) .font(.system(size: 15)) .padding(.vertical, 6)
                        }.padding(4)
                        Spacer()
                    }
                }
            }
            HStack(alignment: .center, spacing: 2){
                ZStack{
                    Rectangle().foregroundColor(.white)
                        .cornerRadius(5).padding(2)
                    HStack{
                        Image("diagnosis") .resizable()
                            .frame(width: 30, height: 30, alignment: .center).padding(.horizontal,10)
                        VStack(alignment:.leading){
                            Text("Diagnosis")
                                .font(.system(size: 14)).foregroundColor(.gray) .padding(.top, 2)

                            Text("\(userModel.tgl_diagnosis, formatter: dateFormatter)") .font(.system(size: 14)).padding(.vertical, 6)
                        }.padding(4)
                        Spacer()
                    }
                }
                ZStack{
                    Rectangle().foregroundColor(.white).cornerRadius(5).padding(2)
                    HStack{
                        Image("Contact") .resizable()
                            .frame(width: 23, height: 23, alignment: .center).padding(.horizontal,10)

                        VStack(alignment:.leading){
                            Text("Kontak Penting")
                                .font(.system(size: 14)).foregroundColor(.gray).padding(.top, 6)
                            
                            Text(userModel.kontak_penting) .font(.system(size: 15)).padding(.vertical, 6)
                        }.padding(4)
                        Spacer()
                    }
                }
            }
            ZStack{
                Rectangle().foregroundColor(.white)
                VStack(alignment: .leading){
                    HStack{
                        Image("circle")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                        
                        Text("Kondisi Saya").font(.system(size: 18)) .fontWeight(.bold)
                        Spacer()
                    }.padding(6)
                    Text(userModel.kondisi).padding(.horizontal,6)
                        .font(.system(size: 13))
                    Spacer()
                }.padding(.horizontal).padding(.bottom).frame(height:200)
            }
        }.onAppear{
            //            let mData = self.mUser
            //            self.profileCancerType = mData.last?.jenis_kanker ?? "-"
            //            self.profileCcancerSite = mData.last?.posisi_kanker ?? "-"
            //            let a = mData.last?.tgl_diagnosis
            //            self.profileCancerDiagnosis = a == nil ? "-" : "\(a!)"
            //            self.profileCancerPathology = mData.last?.kontak_penting ?? "-"
        }
        
        
        
    }
    
    struct ProfileCancerDetailView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileCancerDetailView(userModel: UserModel())
        }
    }
}

