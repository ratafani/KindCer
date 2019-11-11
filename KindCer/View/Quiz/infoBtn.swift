//
//  infoBtn.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


struct infoBtn: View {
    var body: some View {
        Button(action: {
            
        }) {
            ZStack{
                Circle().foregroundColor(.purple).frame(width: 30, height: 30)
                Text("i").foregroundColor(.white).font(.title)
            }.shadow(radius: 20)
        }
    }
}

struct infoBtn_Previews: PreviewProvider {
    static var previews: some View {
        infoBtn()
    }
}
