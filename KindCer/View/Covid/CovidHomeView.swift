//
//  CovidHomeView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 08/04/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct CovidHomeView: View {
    var body: some View {
        VStack {
            Text("Covid-19: Indonesia").font(.system(size: 20)).bold()
            Text("Information of the current situations").font(.system(size: 14))
        }.frame(width: UIApplication.shared.keyWindow?.frame.width, height: 80).background(Color.white)
    }
}

struct CovidHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CovidHomeView()
    }
}
