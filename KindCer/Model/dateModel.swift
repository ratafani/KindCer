//
//  dateModel.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 11/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DateModel : NSObject,ObservableObject{
    
    let objectWillChange = PassthroughSubject<DateModel, Never>()
    
    var currentDate = Date()
    var month = ""
    var date = ""
    var year = ""
    var dayWeek = 0
    
    
    override init() {
        super.init()
        let mDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        
        self.currentDate = mDate
        self.updateCalendar(newDate: mDate)
    }
    func fetch(){
        objectWillChange.send(self)
    }
    
    func updateCalendar(newDate: Date){
        // get the components
        
        let userCalendar = Calendar.current
        
        // choose which date and time components are needed
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second,
            .weekday
        ]
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: newDate)
//        print(dateTimeComponents)
        let a = Calendar.current.monthSymbols
        let m = dateTimeComponents.month ?? 0
        self.currentDate = newDate
        self.month = a[m-1]
        self.date = "\(dateTimeComponents.day ?? 0)"
        self.year = "\(dateTimeComponents.year ?? 0)"
        self.dayWeek = dateTimeComponents.weekday ?? 0
        self.dayWeek-=2
        if self.dayWeek<0 {
            self.dayWeek = 6
        }
        self.fetch()
    }
}
