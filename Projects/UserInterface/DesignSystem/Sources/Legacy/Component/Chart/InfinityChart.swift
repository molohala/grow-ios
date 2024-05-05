//import SwiftUI
//import Charts
//
//public struct GrowChart: View {
//    
//    private let data: GrowChartData.Data
//    private let color: Color
//    private let backgroundColor: LinearGradient
//    
//    public init(
//        chartData: GrowChartData
//    ) {
//        self.data = chartData.data
//        self.color = chartData.color
//        self.backgroundColor = LinearGradient(
//            colors: [
//                color.opacity(0.4),
//                color.opacity(0)
//            ],
//            startPoint: .top,
//            endPoint: .bottom
//        )
//    }
//    
//    public var body: some View {
//        
//        let balancedMax = max(data.max { $0.y < $1.y }?.y ?? 0, 0) + 10
//        
//        ZStack {
//            Chart(data, id: \.x) { i in
//                LineMark(
//                    x: .value("", i.x),
//                    y: .value("", i.y)
//                )
//                .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
//                .interpolationMethod(.cardinal(tension: 0.3))
//                .foregroundStyle(color)
//                AreaMark(
//                    x: .value("", i.x),
//                    y: .value("", i.y)
//                )
//                .lineStyle(.init(lineWidth: 5, lineCap: .round, lineJoin: .round))
//                .interpolationMethod(.cardinal(tension: 0.3))
//                .foregroundStyle(backgroundColor)
//            }
//            .chartXAxis {
//                AxisMarks { axis in
//                    if axis.index % 3 == 0 {
//                        let x = data[axis.index].x
//                        AxisValueLabel("\(x)")
//                            .foregroundStyle(.gray)
//                            .font(.caption2)
//                    }
//                }
//            }
//            .chartYAxis {
//                AxisMarks(
//                    format: .number,
//                    position: .leading,
//                    values: [Int(balancedMax / 3), Int(balancedMax / 3 * 2), balancedMax]
//                )
//            }
//        }
//    }
//}
