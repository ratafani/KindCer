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
    @State var profileCancerType: String = "Breast Cancer"
    @State var profileCcancerSite: String = "Left Site"
    @State var profileCancerDiagnosis: String = "17 Januari 2019"
    @State var profileCancerPathology: String = "-"
    
   
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 2)
            {
            
            
            HStack(alignment: .center, spacing: 2)
                {
                    
                    ZStack
                        {
                            Rectangle().foregroundColor(.white).cornerRadius(5).padding(2)
                            
                            HStack
                                {
                                    Image("cancertype") .resizable()
                                        .frame(width: 23, height: 23, alignment: .center).padding(.horizontal,10)
                                    
                                    VStack(alignment:.leading)
                                        {
                                            Text("Cancer Type")
                                                .font(.system(size: 14)).foregroundColor(.gray)
                                            
                                            
                                            
                                            Text(userModel.jenis_kanker)
                                                .font(.system(size: 15))
                                            
                                        } .padding(4)
                                    Spacer()
                            }
                            
                    }
                    
                    ZStack
                        {
                            Rectangle().foregroundColor(.white)
                            .cornerRadius(5).padding(2)
                            HStack
                                {
                                    Image("cancersite") .resizable()
                                        .frame(width: 15, height: 35, alignment: .center).padding(.horizontal,10)
                                    VStack(alignment:.leading)
                                        {
                                            Text("Cancer Site")
                                                .font(.system(size: 14)).foregroundColor(.gray)
                                            Text(userModel.posisi_kanker) .font(.system(size: 15))
                                    }.padding(4)
                                    Spacer()
                            }
                    }
                    
            }
            
            HStack(alignment: .center, spacing: 2)
                {
                    
                    ZStack
                        {
                            Rectangle().foregroundColor(.white)
                            .cornerRadius(5).padding(2)
                            HStack
                                {
                                    Image("diagnosis") .resizable()
                                        .frame(width: 30, height: 30, alignment: .center).padding(.horizontal,10)
                                    VStack(alignment:.leading)
                                        {
                                            Text("Diagnosis")
                                                .font(.system(size: 14)).foregroundColor(.gray)
                                            Text("\(userModel.tgl_diagnosis)") .font(.system(size: 15))
                                    }.padding(4)
                                    Spacer()
                            }
                            
                    }
                    
                    ZStack
                        {
                            Rectangle().foregroundColor(.white)
                            .cornerRadius(5).padding(2)
                            HStack
                                {
                                    Image("Contact") .resizable()
                                        .frame(width: 23, height: 23, alignment: .center).padding(.horizontal,10)
                                    VStack(alignment:.leading)
                                        {
                                            Text("Kontak Penting")
                                                .font(.system(size: 14)).foregroundColor(.gray)
                                            Text(userModel.kontak_penting) .font(.system(size: 15))
                                    }
                                    Spacer()
                            }
                    }
                    
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

