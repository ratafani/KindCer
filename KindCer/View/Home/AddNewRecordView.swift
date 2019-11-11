//
//  AddNewRecordView.swift
//  KindcerOnboarding
//
//  Created by Rizky Adipratama Ruddyar on 22/10/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct AddNewRecordView: View {
    var body: some View {
        VStack {
            Spacer()
            recordAddBtn(iconName: "Papsmearselect4x")
            Spacer()
            recordAddBtn(iconName: "HPVselect4x")
            Spacer()
            recordAddBtn(iconName: "Biopsyselect4x")
            Spacer()
            recordAddBtn(iconName: "Colposcopyselect4x")
            Spacer()
        } .padding()
        
    }
}

struct recordAddBtn: View {
    @State var iconName = ""
    var body: some View{
        Button(action: {
            
        }) {
            Image(iconName) .resizable()
                .renderingMode(.original).scaledToFit()
                
        }
    }
}

struct AddNewRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecordView()
    }
}



