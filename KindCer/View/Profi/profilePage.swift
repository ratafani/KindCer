//
//  profilePage.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct profilePage: View {
    
    var body: some View {
        VStack{
            vCardProfile()
            profileListItem().offset(y:-45)
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9433087707, green: 0.9377009273, blue: 0.9476192594, alpha: 1))).edgesIgnoringSafeArea(.all))
    }
}

struct profilePage_Previews: PreviewProvider {
    static var previews: some View {
        profilePage()
    }
}
