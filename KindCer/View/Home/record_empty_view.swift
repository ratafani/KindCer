//
//  record_empty_view.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 23/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct record_empty_view: View {
    var body: some View {
        VStack {
            Image("record_icon")
            Text("No Record Available").foregroundColor(Color.init(#colorLiteral(red: 0.6538955569, green: 0.4216387272, blue: 0.7900664806, alpha: 1))).bold().padding(.bottom,10)
            Text("Add your record and enpower yourself with your servical cancer risks").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center).padding(.horizontal,60)
        }
    }
}

struct record_empty_view_Previews: PreviewProvider {
    static var previews: some View {
        record_empty_view()
    }
}
