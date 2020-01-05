//
//  TimePicker.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 04/01/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct TimePicker: View {
    @State private var hour = 0
    @State private var minute = 0
    @Binding var picked : Bool
    @Binding var jadwalObat : [String]
    
    let minutes = [0, 15, 30, 45]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Jam berapa obat di minum?")
                HStack {
                    Picker("Hour", selection: self.$hour) {
                        ForEach(0...23, id: \.self) {
                            Text("\($0)")
                        }
                    }.labelsHidden().frame(width: geometry.size.width/4).clipped()
                    
                    Picker("Minutes", selection: self.$minute) {
                        ForEach(self.minutes, id: \.self) { minute in
                            Text(minute == 0 ? " : 0\(minute)" : " : \(minute)")
                        }
                    }.labelsHidden().frame(maxWidth: geometry.size.width / 4)
                        .clipped()
                    
                }
                HStack{
                    Button(action: {
                        withAnimation{
                            self.jadwalObat.append("\(self.hour) \(self.minute == 0 ? " : 0\(self.minute)" : " : \(self.minute)")")
                            self.picked.toggle()
                        }
                    }) {
                        Text("Simpan")
                    }.padding(20)
                    Button(action: {
                        withAnimation{
                            self.picked.toggle()
                        }
                        
                    }) {
                        Text("Cancel").foregroundColor(.red)
                    }.padding(20)
                }
            }.padding().background(Rectangle().foregroundColor(.white).cornerRadius(10))
        }
    }
}


struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(picked: .constant(true), jadwalObat: .constant([]))
    }
}
