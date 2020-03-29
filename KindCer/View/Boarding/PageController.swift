//
//  PageController.swift
//  KindcerOnboarding
//
//  Created by Rizky Adipratama Ruddyar on 21/10/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import SwiftUI

struct PageController: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.pageIndicatorTintColor = UIColor.systemGray
        control.currentPageIndicatorTintColor = UIColor(red: 152/255, green: 100/255, blue: 226/255, alpha: 1.0)
        control.frame(forAlignmentRect: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    
}

