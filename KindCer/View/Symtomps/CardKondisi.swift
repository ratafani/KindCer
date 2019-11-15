//
//  CardKondisi.swift
//  KindCer2.0
//
//  Created by Rizky Adipratama Ruddyar on 12/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct CardKondisi: View {
    @Binding var kondisi: String
    @Binding var penjelasan : String
    @State var theColor : Color = .red
    var body: some View {
        ZStack
            {
                Rectangle().foregroundColor(.white)
                HStack
                    {
                        VStack
                            {
                                Text("Kondisi")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                
                                Text(kondisi)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 27))
                                    .foregroundColor(theColor)
                                
                                Text(penjelasan)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .padding(.top)
                                
                        }.padding()
                        
                        Image("ringancondition") .resizable()
                            .frame(width: 181, height: 171, alignment: .center)
                }.onAppear{
                    self.gantiWarna()
                }
        }
    }
    
    
    func gantiWarna(){
        let a = self.kondisi
        //            print(a)
        if a == "Sedang"{
            self.theColor = Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1))
        }else if a == "Ringan"{
            self.theColor = .blue
        }else if a == "Bahaya"{
            self.theColor = .red
        }else{
            
        }
    }
}

struct CardKondisi_Previews: PreviewProvider {
    static var previews: some View {
//        CardKondisi()
        Text("")
    }
}
