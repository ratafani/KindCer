//
//  RiwayatPage.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 26/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct RiwayatPage: View {
    
    @ObservedObject var jadwal : JadwalModel = JadwalModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var pickerSelection = "1"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "Primary") ?? UIColor.purple
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "Primary") ?? UIColor.purple], for: .normal)
    }
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                ZStack{
                    Rectangle().foregroundColor(Color("Primary")).frame( height: 70)
                    VStack{
                        Rectangle().foregroundColor(.white).opacity(0.3).frame(width: 50, height: 5).cornerRadius(10)
                        Text("Jadwal").font(.system(size: 18, design: .default)).bold().foregroundColor(.white)
                    }
                    HStack{
                        
                        Button("Tutup"){
                            self.presentationMode.wrappedValue.dismiss()
                        }.foregroundColor(Color.white).padding(.horizontal)
                        
                        Spacer()
                        
                        Button("Bagikan"){
                            
                        }.foregroundColor(Color.white).padding(.horizontal)
                    }
                }
                Picker("", selection: self.$pickerSelection) {
                    Text("Treatment").tag("1")
                  Text("Obat Harian").tag("2")
                }
                .padding(.horizontal,10)
                .pickerStyle(SegmentedPickerStyle())
                
                if self.pickerSelection == "1"{
                    TreatmentPage()
                }else{
                    ObatPage()
                }
            }.background(Color("inActive")).edgesIgnoringSafeArea(.all)
        }
    }
}

struct RiwayatPage_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatPage()
    }
}

