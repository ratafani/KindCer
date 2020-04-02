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
        let mkondisi = NSLocalizedString(kondisi, comment: "")
        let mpenjelasan = NSLocalizedString(penjelasan, comment: "")
        return ZStack
            {
                Rectangle().foregroundColor(.white)
                HStack
                    {
                        VStack
                            {
                                Text("Kondisi")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                
                                Text(mkondisi)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 27))
                                    .foregroundColor(gantiWarna())
                                
                                Text(mpenjelasan)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .padding(.top)
                                    .multilineTextAlignment(.center)
                                
                        }.padding()
                        
                        Image(kondisi) .resizable()
                            .frame(width: 181, height: 171, alignment: .center)
                }
        }
    }
    
    
    func gantiWarna() -> Color{
        let a = self.kondisi
        //            print(a)
        var mColor = Color.red
        if a == "Sedang"{
            mColor = Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1))
        }else if a == "Ringan"{
            mColor = .blue
        }else if a == "Bahaya"{
            mColor = .red
        }else{
            
        }
        return mColor
    }
}

struct CardKondisi_Previews: PreviewProvider {
    static var previews: some View {
        //        CardKondisi()
        Text("")
    }
}
