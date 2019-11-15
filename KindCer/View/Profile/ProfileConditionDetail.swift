//
//  ProfileConditionDetail.swift
//  NewKindcer
//
//  Created by Rizky Adipratama Ruddyar on 11/11/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct ProfileConditionDetail: View {
   
    @State var profileCancerCondition: String = ""
    @ObservedObject var userModel: UserModel
    var body: some View {
        
        ZStack{
            Rectangle().foregroundColor(.white)
            
            VStack(alignment: .leading)
                 {
                     HStack
                             {
                                 Image("circle")
                                     .resizable()
                                     .frame(width: 24, height: 24, alignment: .center)
                                 
                                 Text("Kondisi Saya").font(.system(size: 18)) .fontWeight(.bold)
                                 
                                 Spacer()
                                 
                     }.padding(6)
                     
                    Text(userModel.kondisi).padding(.horizontal,6)
                        .font(.system(size: 13))
                     
                     
            }.padding(.horizontal).padding(.bottom)
            
        }.onAppear{
//            self.profileCancerCondition = self.mUser.first?.kondisi ?? "masih kosong"
//            print(self.userModel.kondisi)
        }
    }
}

struct ProfileConditionDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConditionDetail(userModel: UserModel())
    }
}
