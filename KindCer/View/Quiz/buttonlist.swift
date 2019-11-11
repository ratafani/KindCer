//
//  buttonlist.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 21/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI



struct buttonlist: View {
    
    var body: some View{
        VStack {
            HStack{
                button(for: "incorrect")
                button(for: "correct")
            }
        }
    }
    
    func button(for icon: String) -> some View {
        Button(action: {}) {
            Image(icon)
                .renderingMode(.original)
        }
    }
}

struct buttonlist_Previews: PreviewProvider {
    static var previews: some View {
        buttonlist()
    }
}
