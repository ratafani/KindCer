//
//  PageView.swift
//  KindcerOnboarding
//
//  Created by Rizky Adipratama Ruddyar on 21/10/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct PageView<Page:View>: View {
    
    var viewControllers: [UIHostingController<Page>]
    
    @Binding var isOnboardingDone: Bool
    
    @State var currentPage: Int = 0
    
    init(_ views: [Page], isOnboardingDone: Binding<Bool> ) {
        self.viewControllers = views.map {UIHostingController (rootView: $0)}
        self._isOnboardingDone = isOnboardingDone
    }
    
    var body: some View {
        VStack{
             PageViewController(controllers: viewControllers,currentPage: $currentPage)
            
            if currentPage == 2
                        {
                        Button (action: {
                            self.isOnboardingDone.toggle()
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 360, height: 60, alignment: .center)
                                        .foregroundColor(Color.purple)
                                    .overlay(
                                    Text("Get Started")
                                    .foregroundColor(Color.white))
                                        
                            })
                            
                    
                        }
            else
            {
                Button (action: {
                    }, label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 360, height: 60, alignment: .center)
                            .foregroundColor(Color.purple)
                        .opacity(0)
                        .overlay(
                        Text("Get Started")
                        .foregroundColor(Color.white))
                            
                })
            }
                        
            
            PageController(numberOfPages: viewControllers.count, currentPage: $currentPage)
            
        

        }
        }
       
    }


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(cards.map{OnboardingCardView(card: $0)}, isOnboardingDone: .constant(false))
        
    }
}
