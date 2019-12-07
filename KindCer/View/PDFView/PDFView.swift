//
//  PDFView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 07/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI
import MessageUI

struct PDFView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var invoiceComposer = InvoiceComposer()
    @State var showShareSheet = false
    var body: some View {
        ZStack {
            VStack {
                ZStack{
                    headerModal(title: "PDF Preview").padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    HStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Tutup").foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            self.showShareSheet.toggle()
                        }) {
                            Text("Email").foregroundColor(.white)
                        }
                    }.padding(.horizontal,25)
                }
                WebView(invoiceComposer: $invoiceComposer)
            }
        }.sheet(isPresented: $showShareSheet) {
            
            
            ShareSheet(activityItems: [NSData(contentsOfFile: self.invoiceComposer.pdfFilename)!])
        }
    }
    
}

struct PDFView_Previews: PreviewProvider {
    static var previews: some View {
        PDFView()
    }
}
