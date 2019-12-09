//
//  Webview.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 07/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let pdf = Bundle.main.path(forResource: "My CV", ofType: "pdf")
    @Binding var invoiceComposer: InvoiceComposer
    @Binding var htmlPdf : String
    @Binding var web : WKWebView
    func makeUIView(context: Context) -> WKWebView  {
        let web = WKWebView()
        
        if let invoiceHTML = invoiceComposer.renderInvoice(invoiceNumber: "",invoiceDate: "invoiceDate",recipientInfo: "recipientInfo",totalAmount: "String") {
            let fileURL = URL(fileURLWithPath: invoiceComposer.pathToInvoiceHTMLTemplate!)
            DispatchQueue.main.async{

                
                self.htmlPdf = invoiceHTML
            }
            web.loadHTMLString(invoiceHTML, baseURL: fileURL)
            
            
        }
        return web
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        DispatchQueue.main.async{

            
            self.web = uiView
        }
        
    }
    
    
}


class InvoiceComposer: NSObject {
    
    let pathToInvoiceHTMLTemplate = Bundle.main.path(forResource: "invoice", ofType: "html")
    
    let pathToSingleItemHTMLTemplate = Bundle.main.path(forResource: "single_item", ofType: "html")
    
    let pathToLastItemHTMLTemplate = Bundle.main.path(forResource: "last_item", ofType: "html")
    
    
    var pdfFilename: String!
    
    override init() {
        super.init()
    }
    
    
    func renderInvoice(invoiceNumber: String, invoiceDate: String, recipientInfo: String,  totalAmount: String) -> String! {
        // Store the invoice number for future use.
        
        
        do {
            // Load the invoice HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToInvoiceHTMLTemplate!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM YYYY"
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PDF_DATE#", with: "\(dateFormatter.string(from: Date()))")
            let usermodel = UserModel()
            let cancers = CancerModel()
            let efek = RecordModel()
            efek.readAllData()
            
            //            let img = Bundle.main.path(forResource: "Logo", ofType: "png")
            //            let fileURL = URL(fileURLWithPath: "")
            //            HTMLContent = HTMLContent.replacingOccurrences(of: "#PHOTO#", with: "\(fileURL)")
            
            
            var pasienInfo = ""
            pasienInfo = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
            pasienInfo = pasienInfo.replacingOccurrences(of: "#JENIS#", with: "\(usermodel.user_name)")
            pasienInfo = pasienInfo.replacingOccurrences(of: "#TANGGAL#", with: "\(dateFormatter.string(from: usermodel.tanggal_lahir))")
            
            let photoURL = Bundle.main.path(forResource: "Logo", ofType: "png")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PHOTO#", with: photoURL!)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PASIEN_INFO#", with: pasienInfo)
            // The invoice items will be added by using a loop.
            var jenis = ""
            for a in cancers.mData{
                var itemHTMLContent: String!
                itemHTMLContent = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
                
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#JENIS#", with: a.name)
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#TANGGAL#", with: "\(dateFormatter.string(from: a.tanngal))")
                jenis += itemHTMLContent
            }
            if cancers.mData.count<1{
                var itemHTMLContent: String!
                itemHTMLContent = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
                
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#JENIS#", with: " - ")
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#TANGGAL#", with: " - ")
                jenis += itemHTMLContent
            }
            HTMLContent = HTMLContent.replacingOccurrences(of: "#JENIS#", with:jenis)
            
            var sType = ""
            
            for a in efek.mData{
                var itemHTMLContent: String!
                itemHTMLContent = try String(contentsOfFile: pathToSingleItemHTMLTemplate!)
                
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#TYPE#", with: a.type + "-" + a.kondisi)
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#DATE#", with: "\(dateFormatter.string(from: a.tanggal))")
                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#DESC#", with: "\(a.penjelasan)")
                sType += itemHTMLContent
            }
            print(sType)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#EFEK#", with:sType)
            // For all the items except for the last one we'll use the "single_item.html" template.
            // For the last one we'll use the "last_item.html" template.
            
            
            
            // The HTML code is ready.
            return HTMLContent
            
        }
        catch {
            print("Unable to open and use HTML template files.")
        }
        
        return nil
    }
    
    
    func exportHTMLContentToPDF(HTMLContent: String, wkView: WKWebView) {
        let printPageRenderer = CustomPrintPageRenderer()
        
        let printFormatter = wkView.viewPrintFormatter()
        
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
        
        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice.pdf"
        pdfData?.write(toFile: pdfFilename, atomically: true)
        
        print(pdfFilename as Any)
    }
    
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        for i in 0..<printPageRenderer.numberOfPages {
            UIGraphicsBeginPDFPage()
            printPageRenderer.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        
        UIGraphicsEndPDFContext()
        
        return data
    }
    
}
struct Webview_Previews: PreviewProvider {
    static var previews: some View {
        WebView(invoiceComposer: .constant(InvoiceComposer()), htmlPdf: .constant(""), web: .constant(WKWebView()))
    }
}
