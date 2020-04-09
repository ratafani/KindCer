//
//  GraphView.swift
//  Covid19WFH
//
//  Created by Muhammad Tafani Rabbani on 24/03/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI

struct LineView:View {
    @State var on = false
    @State var cPoint : CGPoint = .zero
    @ObservedObject var covidModel : CovidModel
    @State var deathData : [CGFloat] = [0,0,0.3,0.4,0.5]
    @State var recoveredData : [CGFloat] =  [0,0,0.3,0.35]
    @State var positiveData : [CGFloat] =  [0,0,0.3,0.5,1]
    @State var title : String = ""
    @State var color : Color = .red
    @State var color2 : Color = .green
    @State var color3 : Color = .blue
    var body: some View{
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Indonesia").font(.system(size: 18)).bold()
                    Text("since \(covidModel.timeSeries?.Indonesia.first?.date ?? "")").font(.system(size: 14))
                }.padding(10)
                Spacer()
            }
            Divider()
            ZStack {
                LineGraph(dataPoints: covidModel.dataConfirmed ?? [])
                    .fill(LinearGradient(gradient: Gradient(colors: [color3.opacity(0.5), .white]), startPoint: .top, endPoint: .bottom))
                    .aspectRatio(18/10, contentMode: .fit)
                    //                    .border(Color.gray, width: 1)
                    .opacity(on ? 1 : 0)
                LineGraph2(dataPoints: covidModel.dataConfirmed ?? [], pos: $cPoint)
                    .trim(to: on ? 1 : 0)
                    .stroke(color3.opacity(0.5),style: StrokeStyle(lineWidth: 3, lineJoin: .round))
                    .aspectRatio(18/10, contentMode: .fit)
                LineGraph(dataPoints: covidModel.dataDeaths ?? [])
                    .fill(LinearGradient(gradient: Gradient(colors: [color.opacity(0.5), .white]), startPoint: .top, endPoint: .bottom))
                    .aspectRatio(18/10, contentMode: .fit)
                    //                    .border(Color.gray, width: 1)
                    .opacity(on ? 1 : 0)
                LineGraph2(dataPoints: covidModel.dataDeaths ?? [], pos: $cPoint)
                    .trim(to: on ? 1 : 0)
                    .stroke(color.opacity(0.5),style: StrokeStyle(lineWidth: 3, lineJoin: .round))
                    .aspectRatio(18/10, contentMode: .fit)
                LineGraph(dataPoints: covidModel.dataRecovered ?? [])
                    .fill(LinearGradient(gradient: Gradient(colors: [color2.opacity(0.5), .white]), startPoint: .top, endPoint: .bottom))
                    .aspectRatio(18/10, contentMode: .fit)
                    //                    .border(Color.gray, width: 1)
                    .opacity(on ? 1 : 0)
                LineGraph2(dataPoints: covidModel.dataRecovered ?? [], pos: $cPoint)
                    .trim(to: on ? 1 : 0)
                    .stroke(color2.opacity(0.5),style: StrokeStyle(lineWidth: 3, lineJoin: .round))
                    .aspectRatio(18/10, contentMode: .fit)
                VStack(alignment: .leading) {
                    HStack{
                        Circle().foregroundColor(.blue).frame(width: 10, height: 10)
                        Text("Positive \(covidModel.timeSeries?.Indonesia.last?.confirmed ?? 0)")
                        Spacer()
                    }.padding(.horizontal,10)
                    HStack{
                        Circle().foregroundColor(.red).frame(width: 10, height: 10)
                        Text("Deaths \(covidModel.timeSeries?.Indonesia.last?.deaths ?? 0)")
                        Spacer()
                    }.padding(.horizontal,10)
                    HStack{
                        Circle().foregroundColor(.green).frame(width: 10, height: 10)
                        Text("Recovered \(covidModel.timeSeries?.Indonesia.last?.recovered ?? 0)")
                        Spacer()
                    }.padding(.horizontal,10)
                }
            }
        }.padding(2).background(Rectangle().cornerRadius(10).foregroundColor(.white).shadow(radius: 10))
            .onAppear{
                withAnimation(.easeInOut(duration: 1)) {
                    self.on.toggle()
                }
        }
        
    }
}

struct LineGraph: Shape {
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }
        
        let graph = Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
            
            p.addLine(to: CGPoint(x: rect.width, y: rect.height))
            p.addLine(to: CGPoint(x: 0, y: rect.height))
            p.closeSubpath()
        }
        
        return graph
    }
}

struct LineGraph2: Shape {
    var dataPoints: [CGFloat]
    
    @Binding var pos: CGPoint
    
    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }
        
        let graph = Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
                
            }
            
        }
        
        return graph
    }
    
}

struct LineView_Previews2: PreviewProvider {
    static var previews: some View {
        ZStack {
            LineView( covidModel: CovidModel())
        }
    }
}
