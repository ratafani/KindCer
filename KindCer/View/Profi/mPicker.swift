//
//  mPicker.swift
//  test1
//
//  Created by Mauldy Putra on 22/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct mPicker: View {
    @State var title = ""
    @State var question =  ""
    @State var choices = [""]
    @State var select = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
            Picker(question, selection: $select) {
                ForEach(choices, id: \.self){
                    geneticDefault in Text(geneticDefault)
                }
            }.opacity(0.5)
        }
    }
}

struct mPicker_Previews: PreviewProvider {
    static var previews: some View {
        mPicker()
    }
}
