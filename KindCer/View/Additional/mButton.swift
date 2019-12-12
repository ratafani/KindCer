//
//  mButton.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct mButton: View {
    
    var body: some View {
        ButtonWithIconActive()
        //        ButtonWithIconActive()
        //        ButtonWithIconInActive()
        
    }
}

struct ButtonDefault: View {
    
    @State var buttonContent: String = "Default"
    
    var body: some View{
        
        ZStack{
            Rectangle().foregroundColor(.purple).frame(width: 360, height: 60).cornerRadius(15)
            Text(buttonContent).foregroundColor(.white)
        }
    }
}

struct ButtonWithIconActive: View{
    
    @State var buttonContent: String = "Default"
    
    var body: some View{
        ZStack{
            Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9137254902, green: 0.262745098, blue: 0.4901960784, alpha: 1))).frame(width: 360, height: 60).cornerRadius(15)
            HStack {
                //                    Image("sampah").foregroundColor(.white)
                Text(buttonContent).foregroundColor(.white)
            }
        }
    }
}

struct ButtonWithIconInActive: View{
    
    @State var buttonContent: String = "Default"
    
    var body: some View{
        Button(action: {
            
        }) {
            ZStack{
                Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9137254902, green: 0.262745098, blue: 0.4901960784, alpha: 1))).frame(width: 360, height: 60).cornerRadius(15)
                HStack {
                    Image("sampah").foregroundColor(.white)
                    Text(buttonContent).foregroundColor(.white)
                }
            }.opacity(0.7)
        }.disabled(true)
    }
}

struct mButton_Previews: PreviewProvider {
    static var previews: some View {
        mButton()
    }
}
