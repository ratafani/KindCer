//
//  LineView.swift
//  LineChart
//
//  Created by András Samu on 2019. 09. 02..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI


public struct CustomLineView: View {
    @ObservedObject var data: ChartData
    public var title: String?
    public var legend: String?
    public var style: ChartStyle
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var showLegend = false
    @State private var dragLocation:CGPoint = .zero
    @State private var indicatorLocation:CGPoint = .zero
    @State private var closestPoint: CGPoint = .zero
    @State private var opacity:Double = 0
    @State private var currentDataNumber: String = ""
    @State private var hideHorizontalLines: Bool = false
    
    public init(data: [Int],date:[String], title: String? = nil, legend: String? = nil, style: ChartStyle? = Styles.lineChartStyleOne){
        
        self.data = ChartData(points: data,date: date)
        self.title = title
        self.legend = legend
        self.style = style!
    }
    
   public var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .leading, spacing: 8) {
                Text((self.data.date.first ?? "") + " - " + (self.data.date.last ?? "") )
                ZStack{
                    GeometryReader{ reader in
                        Rectangle().foregroundColor(self.colorScheme == .dark ? Color.black : self.style.backgroundColor)
                        Line(data: self.data, frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 30, height: reader.frame(in: .local).height)), touchLocation: self.$indicatorLocation,showIndicator: self.$hideHorizontalLines ,showBackground: true).offset(x: 30, y: 0)
                            .onAppear(){
                                self.showLegend.toggle()
                            }
                        if(self.showLegend){
                            CustomLegend(data: self.data, frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width + 30, height: reader.frame(in: .local).height)), hideHorizontalLines: self.$hideHorizontalLines)
                                .transition(.opacity)
                                .animation(Animation.easeOut(duration: 0.4).delay(0.4))
                        }
                    }.frame(width: geometry.frame(in: .local).size.width, height: 200)
                    MagnifierRect(currentNumber: self.$currentDataNumber)
                        .opacity(self.opacity)
                        .offset(x: self.dragLocation.x - geometry.frame(in: .local).size.width/2, y: 36)
                }
                .frame(width: geometry.frame(in: .local).size.width, height: 200)
                .gesture(DragGesture()
                    .onChanged({ value in
                        self.dragLocation = value.location
                        self.indicatorLocation = CGPoint(x: max(value.location.x-30,0), y: 32)
                        self.opacity = 1
                        self.closestPoint = self.getClosestDataPoint(toPoint: value.location, width: geometry.frame(in: .local).size.width-30, height: 200)
                        self.hideHorizontalLines = true
                    })
                    .onEnded({ value in
                        self.opacity = 0
                        self.hideHorizontalLines = false
                    })
                )
            }
        }
    }
    
    func getClosestDataPoint(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let stepWidth: CGFloat = width / CGFloat(data.points.count-1)
        let stepHeight: CGFloat = height / CGFloat(data.points.max()! + data.points.min()!)

        let index:Int = Int(floor((toPoint.x-15)/stepWidth))
        if (index >= 0 && index < data.points.count){
            self.currentDataNumber = self.data.date[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(self.data.points[index])*stepHeight)
        }
        return .zero
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLineView(data: [0,30,30,65,100,30,30,65,30], date: ["11 Nov","12 Nov","13 Nov","14 Nov","15 Nov","16 Nov","17 Nov","18 Nov","19 Nov"], title: "Demam", legend: "in last 23 days").frame(width: 400, height: 300).padding().offset(x: 0, y: -60)
    }
}

struct IndicatorCircle: View {
    var body: some View {
       Circle()
        .size(width: 12, height: 12)
        .fill(Colors.BorderBlue)
    }
}

struct MagnifierRect: View {
    @Binding var currentNumber:String
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        ZStack{
            Text(currentNumber)
                .font(.system(size: 14, weight: .bold))
                .offset(x: 0, y:-110)
                .animation(.spring())
                .foregroundColor(self.colorScheme == .dark ? Color("Primary") : Color.black)
            if (self.colorScheme == .dark ){
                 RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: self.colorScheme == .dark ? 2 : 0)
                    .frame(width: 60, height: 260)
                    
            }else{
                 RoundedRectangle(cornerRadius: 16)
                    .frame(width: 60, height: 280)
                    .foregroundColor(Color.white)
                    .shadow(color: Color("Primary"), radius: 12, x: 0, y: 6 )
                    .blendMode(.multiply)
            }
           

        }.animation(.linear)
    }
}
