//
//  profileListItem.swift
//  test1
//
//  Created by Mauldy Putra on 23/10/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import SwiftUI

struct profileListItem: View {
    var body: some View {
        VStack {
            listProfile(title: "Age", status: "27", icon: "Calendar", width: 24, height: 24)
            listProfile(title: "Sex activity", status: "Active", icon: "people", width: 22, height: 26)
            listProfile(title: "Pap smear test status", status: "Once a year", icon: "container", width: 21, height: 28)
            listProfile(title: "Vaccine status", status: "Once a year", icon: "needle", width: 20.27    , height: 30.04)
            listProfile(title: "Genetic status", status: "Negative", icon: "circle", width: 24, height: 24)
        }
    }
}

struct profileListItem_Previews: PreviewProvider {
    static var previews: some View {
        profileListItem()
    }
}
