//
//  HomeView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 22/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


enum HomeSheet{
    case Profile
    case Summary
    case Record
    case rDetail
}
struct HomeView: View {
    
    @State var mStatus : CGFloat = 100
    @State var mSymptoms : [String] = []
    @ObservedObject var dateModel: DateModel
    @ObservedObject var recordModel: RecordModel
    @State var record : RecordType = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
    @ObservedObject var profileModel : UserModel = UserModel()
    @State var isSheet : Bool = false
    @State var isAlarm : Bool = false
    @State var title = "Halo,"
    @State var homeSheet : HomeSheet = .Profile
    //    @State var a : RecordModel = RecordModel()
    
    var body: some View {
        
        return VStack {
            HStack{
                VStack(alignment: .leading) {
                    Text(title).font(.title).bold()
                    Text(UserModel().user_name.isEmpty ? " ":UserModel().user_name).font(.title).bold()
                }
                Spacer()
                if (!UserModel().photo.isEmpty){
                    Image(uiImage: UIImage(data: UserModel().photo)!).resizable().frame(width: 60, height: 60).scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5).onTapGesture {
                        self.isSheet = true
                        self.homeSheet = HomeSheet.Profile
                    }
                }else{
                    Image("photo1").resizable().frame(width: 60, height: 60).scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5).onTapGesture {
                        self.isSheet = true
                        self.homeSheet = HomeSheet.Profile
                    }
                }
                
                
            }.padding(.horizontal,20).background(Color.clear)
            Button(action: {
                self.isSheet = true
                self.homeSheet = HomeSheet.Summary
            }) {
                ZStack {
                    Rectangle().foregroundColor(Color("Primary")).frame( height: 50)
                    HStack {
                        Image("summaryIcon").resizable().foregroundColor(.white).frame(width: 30, height: 30)
                        Text("Lihat Rangkuman Saya").foregroundColor(.white)
                        Spacer()
                    }.padding(.horizontal)
                }
            }
            CalendarView(dateModel: dateModel,recordModel: recordModel)
            HStack{
                Text("Gejala (\(recordModel.mData.count))").padding(.horizontal)
                Spacer()
                Button(action: {
                    if self.dateModel.currentDate.timeIntervalSince1970 <= Date().timeIntervalSince1970{
                        self.isSheet = true
                        self.homeSheet = HomeSheet.Record
                        
                    }else{
                        self.isAlarm = true
                    }
                }) {
                    Text("Tambah").foregroundColor(Color("Primary"))
                }.padding(.horizontal)
            }.padding(.vertical,10)
            ScrollView{
                
                if recordModel.mData.isEmpty{
                    
                    RecordIsEmptView(isSheet: $isSheet,isAlarm: $isAlarm, homeSheet: $homeSheet,tanggal: dateModel.currentDate,dateModel: dateModel)
//                        .disabled(dateModel.currentDate.timeIntervalSince1970>Date().timeIntervalSince1970)
                    
                    
                }else{
                    VStack{
                        ForEach(recordModel.mData,id:\.id){ m in
                            
                            recordCard(record: m, recordModel: self.recordModel, isSheet: self.$isSheet, homeSheet: self.$homeSheet, theRecord: self.$record)
                        }
                    }
                }
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9466523528, green: 0.9410246611, blue: 0.9509779811, alpha: 1))).edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isSheet) {
                
                if self.homeSheet == HomeSheet.Profile{
                    ProfilePage(userModel: self.profileModel, jadwal: JadwalModel())
                }else if self.homeSheet == HomeSheet.Summary{
                    //                    self.a = self.recordModel
                    //                    self.a.readAllData()
                    //                    self.recordModel.readAllData()
                    if self.isSummary(){
                        SummaryEmpty()
                    }else{
                        SummaryView(a: self.prepareSummary())
                    }
                    
                }else if self.homeSheet == HomeSheet.Record{
                    SymptompsAdd( recordModel: self.recordModel,homeSheet : self.$isSheet,now: self.dateModel.currentDate)
                }else{
//                    SymtompsDetail2( recordModel: self.recordModel, record: self.record)
                }
        }.alert(isPresented: $isAlarm, content: {
            Alert(title: Text("Hallo dari masa depan!"), message: Text("Kamu tidak bisa memasukan data ke masa depan kamu, sabar ya"), dismissButton: .default(Text("Oke")))
        }).onAppear{
            
            //            self.recordModel.readData(date: self.dateModel.currentDate)
        }
    }
    
    func isSummary()->Bool{
        
        let a = RecordModel()
        a.readAllData()
        return a.mData.isEmpty
    }
    
    
    func prepareSummary()->RecordModel{
        
        let a = RecordModel()
        a.readAllData()
        return a
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(dateModel: DateModel(),recordModel : RecordModel())
    }
}
