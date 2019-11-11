//
//  QuizCard.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 21/10/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct QuizCard: View {
    @State var photo:String = "photo"
    @State var statement:String = "Vaccine is needed only once in your live!"
    @State var status:String = "“You haven’t had a vaccine before”"
    @State private var mColor:Color = Color("line")
    @State private var currentPosition: CGSize = .zero
    
    var body: some View {
        ZStack {
            BackgroundImage(photo: photo)
            .overlay (
                    ZStack {
                        Rectangle()
                            .fill (
                                LinearGradient(gradient: Gradient(colors: [.clear, mColor]),
                                               startPoint: .center, endPoint: .bottom)
                        )
                            .clipped()
                        Rectangle()
                            .fill (
                                LinearGradient(gradient: Gradient(colors: [mColor,.clear,.clear,.clear, mColor]),
                                               startPoint: .leading, endPoint: .trailing)
                        )
                            .clipped()
                        Rectangle()
                            .fill (
                                LinearGradient(gradient: Gradient(colors: [mColor,.clear,.clear]),
                                               startPoint: .top, endPoint: .center)
                        )
                            .clipped()
                }.cornerRadius(10)
            )
            VStack {
                HStack {
                    Spacer()
                    infoBtn().padding()
                }
                Spacer()
                Text(statement).font(.body).foregroundColor(.white)
                Text(status).font(.body).foregroundColor(.purple)
                buttonlist().padding(.bottom,10)
            }
            
        }
        .offset(x: self.currentPosition.width, y: self.currentPosition.height)
        .gesture(DragGesture()
            .onChanged { value in
                withAnimation {
                    self.currentPosition = CGSize(width: value.translation.width , height: value.translation.height )
                    if(self.currentPosition.width>150){
                        self.mColor = .green
                    }else
                    if(self.currentPosition.width < -150){
                        self.mColor = .red
                    }else{
                        self.mColor = Color("line")
                    }
                }
//                print(value.translation.width,self.mColor)
                
        }   // 4.
            .onEnded { value in
                self.currentPosition = .zero
                self.mColor = Color("line")
//                print(self.currentPosition.width,self.mColor)
            })

    }
}


struct BackgroundImage: View {
    @State var photo:String = "photo"
    var body: some View {
        Image(photo)
            .resizable()
            .cornerRadius(10, antialiased: true)
    }
}
struct QuizCard_Previews: PreviewProvider {
    static var previews: some View {
        QuizCard()
    }
}
