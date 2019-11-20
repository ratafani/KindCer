//
//  calendarView.swift
//  VoiceRecorderFinished
//
//  Created by Muhammad Tafani Rabbani on 11/11/19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    // get the current date and time
    @ObservedObject var dateModel: DateModel
    @ObservedObject var recordModel: RecordModel
    // get the user's calendar
    var body: some View {
        VStack {
            
            DateView(weekDay: dateModel.dayWeek,mDate: dateModel.currentDate,dateModel: dateModel,recordModel: recordModel)
            
        }.background(Color.white)
    }
    
}

struct DateView:View {
    var weekDay : Int
    var mDate : Date
    @ObservedObject var dateModel: DateModel
    @ObservedObject var recordModel: RecordModel
    @State var viewState = CGSize.zero
    @State var arrDate:[Date] = [Date(),Date(),Date(),Date(),Date(),Date(),Date()]
    @State var arrPicked:[Bool] = [false,false,false,false,false,false,false]
    @State var arrday:[Int] = [0,0,0,0,0,0,0]
    var body: some View{
        VStack {
            HStack {
                Button(action: {
                    self.prevWeek()
                }) {
                    Image("prevWeek")
                }.buttonStyle(PlainButtonStyle())
                
                Text("\(dateModel.date), \(dateModel.month) \(dateModel.year)").bold()
                Button(action: {
                    self.nextWeek()
                }) {
                    Image("nextWeek")
                }.buttonStyle(PlainButtonStyle())
            }.padding()
            HStack {
    //            Text("<").foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).padding(.leading,15).onTapGesture {
    //                self.prevWeek()
    //            }
                Spacer()
                HStack {
                    DayView(date: $arrday[0], isPicked: $arrPicked[0]).padding(.horizontal,4).onTapGesture {
                        self.taped(index: 0)
                    }
                    DayView(day:"Tue", date: $arrday[1],isPicked: $arrPicked[1]).padding(.horizontal,4).onTapGesture {
                        //                self.mDate = self.arrDate[1]
                        //                print("tap")
                        self.taped(index: 1)
                    }
                    DayView(day:"Wed", date: $arrday[2],isPicked: $arrPicked[2]).padding(.horizontal,4).onTapGesture {
                        //                self.mDate = self.arrDate[2]
                        //                print("tap")
                        self.taped(index: 2)
                    }
                    DayView(day:"Thu", date: $arrday[3],isPicked: $arrPicked[3]).padding(.horizontal,4).onTapGesture {
                        //                self.mDate = self.arrDate[3]
                        self.taped(index: 3)
                    }
                    DayView(day:"Fri", date: $arrday[4],isPicked: $arrPicked[4]).padding(.horizontal,4).onTapGesture {
                        //                self.mDate = self.arrDate[4]
                        self.taped(index: 4)
                    }
                    DayView(day:"Sat", date: $arrday[5],isPicked: $arrPicked[5]).padding(.horizontal,4).onTapGesture {
                        //                self.mDate = self.arrDate[5]
                        self.taped(index: 5)
                    }
                    DayView(day:"Sun", date: $arrday[6],isPicked: $arrPicked[6]).padding(.horizontal,4).onTapGesture {
                        //                self.mDate = self.arrDate[6]
                        self.taped(index: 6)
                    }
                    
                }.onAppear{
                    self.setDate()
                }
                
                Spacer()
    //            Text(">").foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1))).padding(.trailing,15).onTapGesture {
    //                self.nextWeek()
    //            }
            }
            .offset(x: viewState.width)
            .animation(.easeOut)
            .opacity(1 - Double(abs(viewState.width)/200))
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        self.viewState.width = value.translation.width
                        
                    }
                .onEnded{ value in
                    withAnimation {
                        if self.viewState.width > 100{
                            self.prevWeek()
                        }else if self.viewState.width < -100{
                            
                            self.nextWeek()
                            
                        }
                        self.viewState = CGSize.zero
                    }
                }
            )
        }
    }
    
    func nextWeek(){
        let mDate = self.dateModel.currentDate.addingTimeInterval(7 * 60 * 60 * 24)
        self.dateModel.updateCalendar(newDate: mDate)
        self.setDate()
    }
    func prevWeek(){
        let mDate = self.dateModel.currentDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.dateModel.updateCalendar(newDate: mDate)
        self.setDate()
    }
    func taped(index:Int){
        self.dateModel.updateCalendar(newDate: self.arrDate[index])
        recordModel.readData(date: dateModel.currentDate)
        for i in 0...6{
            self.arrPicked[i]=false
        }
        self.arrPicked[index] = true
    }
    func setDate(){
        arrDate[dateModel.dayWeek] = dateModel.currentDate
        
        arrPicked[dateModel.dayWeek] = true
        
        var mDate = dateModel.currentDate
        var i = dateModel.dayWeek - 1
        
        while i>=0{
            
            mDate = mDate.addingTimeInterval((-60 * 60 * 24))
            
            arrDate[i] = mDate
            i-=1
            
        }
        i = dateModel.dayWeek + 1
        mDate = dateModel.currentDate
        while i<7 {
            mDate = mDate.addingTimeInterval(60 * 60 * 24)
            
            arrDate[i] = mDate
            i+=1
            
        }
        for i in 0...6{
            let requestedComponents: Set<Calendar.Component> = [
                .year,
                .month,
                .day,
                .weekday
            ]
            let userCalendar = Calendar.current
            let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: arrDate[i])
            arrday[i] = dateTimeComponents.day ?? 0
        }
        
        
    }
}
struct DayView:View {
    
    @State var day = "Mon"
    @Binding var date:Int
    @Binding var isPicked : Bool
    var body: some View{
        VStack {
            Text(day).font(.system(size: 14, design: .default)).bold().foregroundColor(isPicked ? Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1)):Color.black).padding(.bottom,15)
            ZStack {
                Circle().foregroundColor(isPicked ? Color("Primary"): Color.white).frame(width: 30, height: 30).offset(x: 0, y: -6)
                Text("\(date)").font(.system(size: 20, design: .default)).foregroundColor(isPicked ? Color.white:Color.black).padding(.bottom,15)
            }
        }.padding(.horizontal,3)
    }
}


struct YearView:View {
    @Binding var year : String
    var body: some View{
        ZStack {
            
            Circle().foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1).withAlphaComponent(0.3))).padding()
            
            
            Circle().foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1).withAlphaComponent(0.3))).padding().offset(x: 10, y: 10)
            Circle().foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1).withAlphaComponent(0.3))).padding().offset(x: -10, y: -10)
            Circle().foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1).withAlphaComponent(0.3))).padding().offset(x: -10, y: 10)
            Circle().foregroundColor(Color.init(#colorLiteral(red: 0.5215686275, green: 0.3176470588, blue: 0.8392156863, alpha: 1).withAlphaComponent(0.3))).padding().offset(x: 10, y: -10)
            Text(year).foregroundColor(.white).font(.title).bold()
        }.shadow(color:Color("Primary"),radius: 10)
    }
}
struct calendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(dateModel: DateModel(), recordModel: RecordModel())
    }
}
