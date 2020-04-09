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
    case Jadwal
    case Covid
}
struct HomeView: View {
    
    @State var mStatus : CGFloat = 100
    @State var mSymptoms : [String] = []
    @ObservedObject var dateModel: DateModel
    @ObservedObject var recordModel: RecordModel
    @ObservedObject var covidModel = CovidModel()
    @State var record : RecordType = RecordType(id: StaticModel.id, type: "", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
    @ObservedObject var profileModel : UserModel = UserModel()
    @State var isSheet : Bool = false
    @State var isAlarm : Bool = false
    @State var alarmType = 0
    @State var homeSheet : HomeSheet = .Profile
    let hour = Calendar.current.component(.hour, from: Date())
    //    @State var a : RecordModel = RecordModel()
    
    var body: some View {
        
        let gejala = NSLocalizedString("Gejala",comment: "")
        return GeometryReader { geometry in
            return VStack {
                HStack{
                    VStack(alignment: .leading) {
                        Text("Jurnal Efek Samping") .font(.title).bold()
                    }
                    Spacer()
                    if (!UserModel().photo.isEmpty){
                        Image(uiImage: UIImage(data: UserModel().photo)!).resizable().frame(width: 60, height: 60).scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5).onTapGesture {
                            self.isSheet = true
                            self.homeSheet = HomeSheet.Profile
                        }
                    }else{
                        Image("anonymous").resizable().frame(width: 60, height: 60).scaledToFit().overlay(Circle().stroke(Color.white, lineWidth: 5)).clipShape(Ellipse()).shadow(color: Color("Primary"), radius: 5).onTapGesture {
                            self.isSheet = true
                            self.homeSheet = HomeSheet.Profile
                        }
                    }
                }.padding(.horizontal,20).background(Color.clear)
                ZStack {
                    Rectangle().foregroundColor(.white).frame(height: geometry.frame(in: .global).height/12)
                    HStack {
                        Button(action: {
                            self.isSheet = true
                            self.homeSheet = HomeSheet.Summary
                        }) {
                            ZStack
                                {
                                    
                                    Rectangle().foregroundColor(Color(#colorLiteral(red: 0.9489468932, green: 0.9490606189, blue: 0.9489082694, alpha: 1)))
                                        .frame(height: geometry.frame(in: .global).height/18) .cornerRadius(10)
                                    HStack{
                                        Image("summary")
                                            .resizable()
                                            .frame(width: geometry.frame(in: .global).height/40 ,height: geometry.frame(in: .global).height/40)
                                        Text("Rangkuman")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .frame(width: geometry.frame(in: .global).width/3.5)
                                    }
                            }
                        }
                        Spacer()
                        Button(action: {
                            self.isSheet = true
                            self.homeSheet = HomeSheet.Jadwal
                        }) {
                            ZStack{
                                ZStack{
                                    Rectangle().foregroundColor(Color(#colorLiteral(red: 0.9489468932, green: 0.9490606189, blue: 0.9489082694, alpha: 1)))
                                        .frame(height: geometry.frame(in: .global).height/18) .cornerRadius(10)
                                    HStack{
                                        Image("jadwal")
                                            .resizable() .foregroundColor(Color(#colorLiteral(red: 0.4743877649, green: 0.6851971149, blue: 0, alpha: 1)))
                                            .frame(width: geometry.frame(in: .global).height/40 ,height: geometry.frame(in: .global).height/40)
                                        Text("Jadwal")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                        .frame(width: geometry.frame(in: .global).width/3.5)
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal)
                }
                CovidHomeView().onTapGesture {
                    self.isSheet = true
                    self.homeSheet = HomeSheet.Covid
                }
                CalendarView(dateModel: self.dateModel,recordModel: self.recordModel)
                HStack{
                    Text("\(gejala) (\(self.recordModel.mData.count))").padding(.horizontal)
                    Spacer()
                    Button(action: {
                        if self.dateModel.currentDate.timeIntervalSince1970 <= Date().timeIntervalSince1970{
                            self.isSheet = true
                            self.homeSheet = HomeSheet.Record
                        }else{
                            self.isAlarm = true
                            self.alarmType = 0
                        }
                    }) {
                        Text("Tambah").foregroundColor(Color("Primary"))
                    }.padding(.horizontal)
                }.padding(.vertical,10)
                ScrollView{
                    if self.recordModel.mData.isEmpty{
                        RecordIsEmptView(isSheet: self.$isSheet,isAlarm: self.$isAlarm,alarmType: self.$alarmType, homeSheet: self.$homeSheet,tanggal: self.dateModel.currentDate,dateModel: self.dateModel)
                        //                        .disabled(dateModel.currentDate.timeIntervalSince1970>Date().timeIntervalSince1970)
                    }else{
                        VStack{
                            ForEach(self.recordModel.mData,id:\.id){ m in
                                recordCard(record: m, recordModel: self.recordModel, isSheet: self.$isSheet, homeSheet: self.$homeSheet, theRecord: self.$record)
                            }
                            
                        }
                    }
                }
            }.background(Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0.9466523528, green: 0.9410246611, blue: 0.9509779811, alpha: 1))).edgesIgnoringSafeArea(.all))
                .sheet(isPresented: self.$isSheet) {
                    
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
                    }else if self.homeSheet == HomeSheet.Covid{
                        CovidView(covidModel: self.covidModel,recordModel: self.recordModel)
                    }
                    else{
//                        ScheduleMainView(userModel: self.profileModel, jadwal: JadwalModel())
                        RiwayatPage()
                    }
            }.alert(isPresented: self.$isAlarm, content: {
                if self.alarmType == 0{
                    return Alert(title: Text("Halo dari masa depan!"), message: Text("Kamu tidak bisa memasukan data ke masa depan kamu, sabar ya"), dismissButton: .default(Text("Oke")))
                }else{
                    return Alert(title: Text("BAHAYA!"), message: Text("Kamu harus segera menghubungi dokter"), dismissButton: .default(Text("Oke")))
                }
            })
            
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
