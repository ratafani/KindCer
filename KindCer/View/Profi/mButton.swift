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
        Button(action: {
            
        }) {
            ZStack{
                Rectangle().foregroundColor(.purple).frame(width: 360, height: 60).cornerRadius(15)
                Text("Done").foregroundColor(.white)
            }
        }
    }
}

struct mButton_Previews: PreviewProvider {
    static var previews: some View {
        mButton()
    }
}
