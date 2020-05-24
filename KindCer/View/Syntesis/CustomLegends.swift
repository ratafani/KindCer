//
//  Legend.swift
//  LineChart
//
//  Created by András Samu on 2019. 09. 02..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

struct CustomLegend: View {
    @ObservedObject var data: ChartData
    @Binding var frame: CGRect
    @Binding var hideHorizontalLines: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State var maxIdx = 0
    var stepWidth: CGFloat {
        return frame.size.width / CGFloat(data.points.count-1)
    }
    var stepHeight: CGFloat {
        return frame.size.height / CGFloat(data.points.max()! + data.points.min()!)
    }
    @State var arrCategory : [String] = ["Good","Ringan","Sedang","Bahaya"]
    var arrColor : [Color] = [.green,.blue,Color.init(#colorLiteral(red: 0.8745098039, green: 0.6588235294, blue: 0.1764705882, alpha: 1)),.red]
    var body: some View {
        
        return ZStack(alignment: .topLeading){
            ForEach((0...3), id: \.self) { height in
                HStack(alignment: .center){
                    ZStack {
                        Rectangle().foregroundColor(self.data.maxIdx >= height ? self.arrColor[height]:.clear).frame(width: 50, height: 25).cornerRadius(20)
                        Text(NSLocalizedString(self.arrCategory[height],comment: ""))
                            .foregroundColor(self.data.maxIdx >= height ? .white:.clear)
                            .font(.system(size: 10))
                    }.offset(x: -10, y: (self.frame.height-CGFloat(self.getYLegend()![height])*self.stepHeight)-(self.frame.height/2))
                     self.line(atHeight: CGFloat(self.getYLegend()![height]), width: self.frame.width)
                        .stroke(self.colorScheme == .dark ? Colors.LegendDarkColor : Colors.LegendColor, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [5,height == 0 ? 0 : 10]))
                    .offset(x: -10)
                        .opacity((self.hideHorizontalLines && height != 0) ? 0 : 1)
                        .rotationEffect(.degrees(180), anchor: .center)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .animation(.easeOut(duration: 0.1))
                        .clipped()
                }
               
            }
            
        }.onAppear{
           
        }
    }
    
    func populateMarker(){
        self.arrCategory = []
        var max = 0
        for i in self.data.points{
            if i > max{
                max = i
            }
        }
        arrCategory.append("Aman")
        if max>=32{
            arrCategory.append("Ringan")
            
        }
        if max>=64{
            arrCategory.append("Sedang")
            
        }
        if max>=96{
            arrCategory.append("Bahaya")
            
        }
    }
    func line(atHeight: CGFloat, width: CGFloat) -> Path {
        var hLine = Path()
        hLine.move(to: CGPoint(x:5, y: atHeight*stepHeight))
        hLine.addLine(to: CGPoint(x: width, y: atHeight*stepHeight))
        return hLine
    }
    
    func getYLegend() -> [Int]? {
        guard let min = data.points.min() else { return nil }
        if(min >= 0){
            return [0,32,64,96]
        }
        
        return nil
    }
}

struct Legend_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            CustomLegend(data: TestData.data, frame: .constant(geometry.frame(in: .local)), hideHorizontalLines: .constant(false))
        }.frame(width: 320, height: 200)
    }
}
