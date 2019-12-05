//
//  ContentView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 14/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc 
//    @FetchRequest(fetchRequest: User.fetchRequest()) var mUser : FetchedResults<User>
    var body: some View {
        
        return HomeView(dateModel: DateModel(),recordModel: RecordModel(),profileModel: UserModel())
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
