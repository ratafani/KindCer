//
//  homeTitle.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct homeTitle: View {
    @State var title = "adsda"
    @State var subtitle = "dasda"
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(title).font(.title).bold()
                Text(subtitle).font(.title).bold()
            }
            Spacer()
            Button(action: {
                
            }) {
                Text("FAQ").foregroundColor(.purple).bold()
            }
        }.padding(.horizontal,20)
    }
}

struct homeTitle_Previews: PreviewProvider {
    static var previews: some View {
        homeTitle()
    }
}
