//
//  ProfileEditCType.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 09/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ProfileEditCType: View {
    @State var name:String = ""
    @State var tanggal:Date = Date()
    @ObservedObject var typeModel : CancerModel
    @State var cancer : CancerUserType
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -2, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 0, to: Date())!
        return min...max
    }
    var body: some View {
        VStack{
            ZStack {
                headerModal(title: "Jenis Kanker")
                
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Batal").foregroundColor(.white).padding(4)
                        
                    }.padding(16)
                    Spacer()
                    Button(action: {
                        self.typeModel.updateData(data: self.cancer.id, name: self.name, date: self.tanggal)
                        self.typeModel.readData()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Simpan").foregroundColor(.white).padding(4)
                        
                    }.padding(16)
                }
            }
            Form{
                Section(header: HStack {
                    Image("cancertype").resizable().frame(width: 20, height: 20)
                    Text("Jenis Kanker").font(.headline)
                }) {
                    TextField("Jenis Kanker", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal).onAppear{
                        self.name = self.cancer.name
                    }
                    
                }
                Section(header: HStack {
                    Image("diagnosis").resizable().frame(width: 20, height: 20)
                    Text("Tanggal Diagnosis").font(.headline)
                }) {
                    DatePicker(
                        selection: self.$tanggal,
                        in: self.dateClosedRange,
                        displayedComponents: .date,
                        label: { Text("Tanggal Diagnosis").foregroundColor(.clear) .font(.system(size: 15)) .opacity(0.5) }
                    ).labelsHidden().onAppear{
                        self.tanggal = self.cancer.tanngal
                    }
                }
                Section(header: HStack {
                    Text("Delete item").font(.headline)
                }) {
                    Button(action: {
                        self.typeModel.deleteData(data: self.cancer.id)
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Delete").foregroundColor(.red).buttonStyle(PlainButtonStyle())
                    }
                }
            }
            Spacer()
        }.background(Color("inActive"))
    }
}

struct ProfileEditCType_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditCType(typeModel: CancerModel(),cancer: CancerUserType(id: StaticModel.id, name: "", tanngal: Date()))
    }
}
