//
//  headerModal.swift
//  KindCer
//
//  Created by Mauldy Putra on 19/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct headerModal: View {
    
    @State var title = "12121"
    
    var body: some View {
        let a = NSLocalizedString(title,comment: "")
        return ZStack{
            Rectangle().foregroundColor(Color("Primary")).frame(height: 70)
            VStack{
                Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                Text(a).font(.system(size: 24)).bold().foregroundColor(.white)
                
            }
        }//.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct headerModalPicker: View {
    
    @State var title = "1212"
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
            VStack{
                Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                Text("Kondisi").font(.system(size: 24, design: .default)).bold().foregroundColor(.white)
            }
        }
    }
}

struct headerModalWithButton: View {
    
    @State var title = "1212"
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
            VStack{
                Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                Text(title).font(.system(size: 20, design: .default)).bold().foregroundColor(.white)
                ZStack{
                    HStack {
                        Spacer()
                        Button("Done"){
                            
                        }.foregroundColor(.white).padding(.init(top: -30, leading: 0, bottom: 0, trailing: 15))
                    }
                }
            }
        }
    }
}

struct headerModal_Previews: PreviewProvider {
    static var previews: some View {
        headerModal()
    }
}
