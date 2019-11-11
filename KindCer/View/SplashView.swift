//
//  SplashView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 24/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("splashscreenlogo").resizable().frame(width: 203.52, height: 160.59).padding(.vertical,100)
            Spacer()
            Image("splashscreenimg").resizable().scaledToFill()
            
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.5960784314, green: 0.3921568627, blue: 0.8862745098, alpha: 1))).edgesIgnoringSafeArea(.all))
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
