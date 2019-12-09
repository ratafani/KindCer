//
//  PDFView.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 07/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI
import MessageUI
import WebKit

struct PDFView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var invoiceComposer = InvoiceComposer()
    @State var html : String = ""
    @State var web : WKWebView = WKWebView()
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
                            self.invoiceComposer.exportHTMLContentToPDF(HTMLContent: self.html, wkView: self.web)
                            self.showShareSheet.toggle()
                        }) {
                            Text("Kirim").foregroundColor(.white)
                        }
                    }.padding(.horizontal,25)
                }
                WebView(invoiceComposer: $invoiceComposer,htmlPdf: $html,web: $web)
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
