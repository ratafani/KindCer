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


struct LineViewCoba : View {
    @Binding var frame: CGRect
    @State var data = [1,1,1,1,1,4,5,5,5,5,100]
    
    var stepWidth: CGFloat {
        return frame.size.width / CGFloat(data.count-1)
    }
    var stepHeight: CGFloat {
        return frame.size.height / CGFloat(data.max()! + data.min()!)
    }
    var path: Path {
        return Path.quadCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    var path2: Path{
        return Path.quadClosedCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    var body: some View{
        ZStack{
            path
            .stroke(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Primary")]), startPoint: .leading, endPoint: .trailing) ,style: StrokeStyle(lineWidth: 3))
            .shadow(radius: 10)
            .rotationEffect(.degrees(180), anchor: .center)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .animation(.easeOut(duration: 1))
            path2
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.5960784314, green: 0.3921568627, blue: 0.8862745098, alpha: 0.3647527825)), .white]), startPoint: .bottom, endPoint: .top))
            .shadow(radius: 10)
            .rotationEffect(.degrees(180), anchor: .center)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .animation(.easeOut(duration: 1))
        }
            
        
    }
}

struct LineViewCoba_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            LineViewCoba(frame: .constant(geometry.frame(in: .local)))
        }.frame(width: 320, height: 160)
    }
}
