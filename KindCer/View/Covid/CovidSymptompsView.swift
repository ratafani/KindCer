//
//  CovidSymptompsView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 09/04/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct CovidSymptompsView: View {
    var body: some View {
        VStack{
            Text("Covid Symptomps")
        }.background(Rectangle().cornerRadius(10).foregroundColor(.white).shadow(radius: 10))
            
        
    }
}

struct CovidSymptompsView_Previews: PreviewProvider {
    static var previews: some View {
        CovidSymptompsView()
    }
}
