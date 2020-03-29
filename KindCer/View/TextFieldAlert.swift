//
//  TextFieldAlert.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 03/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI


struct MyAlert: View {
    @State private var text: String = ""

    var body: some View {

        VStack {
            Text("Enter Input").font(.headline).padding()

            TextField("Tulis nama kamu", text: self.$text).padding()
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }) {

                    Text("Done")
                }
                Spacer()

                Divider()

                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }) {
                    Text("Cancel")
                }
                Spacer()
            }.padding(0)


            }.background(Color(white: 0.9))
    }
}
struct TextFieldAlert<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool
    @Binding var text: String
    let presenting: Presenting
    let title: Text

    var body: some View {
        ZStack {
            presenting
                .disabled(isShowing)
            VStack {
                title
                TextField("Tulis nama kamu", text: self.$text)
                Divider()
                HStack {
                    Button(action: {
                        withAnimation {
                            self.isShowing.toggle()
                        }
                    }) {
                        Text("Dismiss")
                    }
                }
            }
            .padding()
            .background(Color.white)
            .shadow(radius: 10)
            .opacity(isShowing ? 1 : 0)
        }
    }

}

extension View {

    func textFieldAlert(isShowing: Binding<Bool>,
                        text: Binding<String>,
                        title: Text) -> some View {
        TextFieldAlert(isShowing: isShowing,
                       text: text,
                       presenting: self,
                       title: title)
    }

}


