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
}
struct HomeView: View {
    
    @State var mStatus : CGFloat = 100
    @State var mSymptoms : [String] = []
    @ObservedObject var dateModel: DateModel
    @ObservedObject var recordModel: RecordModel
    @State var isSheet : Bool = false
    @State var title = "Welcome,"
    @State var homeSheet : HomeSheet = .Profile
    
    var body: some View {
        
        return VStack {
            HStack{
                VStack(alignment: .leading) {
                    Text(title).font(.title).bold()
                    Text(UserModel().user_name.isEmpty ? " ":UserModel().user_name).font(.title).bold()
                }
                Spacer()
                Image("photo1").resizable().frame(width: 60, height: 60).scaledToFill().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5).onTapGesture {
                    self.isSheet = true
                    self.homeSheet = HomeSheet.Profile
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
                        Text("Lihat Summary Saya").foregroundColor(.white)
                        Spacer()
                    }.padding(.horizontal)
                }
            }
            CalendarView(dateModel: dateModel,recordModel: recordModel)
            HStack{
                Text("Symptomps (\(recordModel.mData.count))").padding(.horizontal)
                Spacer()
                Button(action: {
                    self.isSheet = true
                    self.homeSheet = HomeSheet.Record
                }) {
                    Text("Tambah").foregroundColor(Color("Primary"))
                }.padding(.horizontal)
            }.padding(.vertical,10)
            ScrollView{
                
                if recordModel.mData.isEmpty{
                    
                    RecordIsEmptView(isSheet: $isSheet, homeSheet: $homeSheet)
                    
                    
                }else{
                    VStack{
                        ForEach(recordModel.mData,id:\.id){ m in
                            
                            recordCard(record: m)
                        }
                    }
                }
            }
        }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9466523528, green: 0.9410246611, blue: 0.9509779811, alpha: 1))).edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isSheet) {
                
                if self.homeSheet == HomeSheet.Profile{
                    ProfilePage(userModel: UserModel(), jadwal: JadwalModel())
                }else if self.homeSheet == HomeSheet.Summary{
                    SummaryView()
                }else{
                    SymptompsAdd( recordModel: self.recordModel,homeSheet : self.$isSheet,now: self.dateModel.currentDate)
                }
        }.onAppear{
            
            //            self.recordModel.readData(date: self.dateModel.currentDate)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(dateModel: DateModel(),recordModel : RecordModel())
    }
}
