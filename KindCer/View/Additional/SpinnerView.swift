//
//  SpinnerView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 08/04/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct SpinnerView: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<SpinnerView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<SpinnerView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView(isAnimating: .constant(true), style: .large)
    }
}
