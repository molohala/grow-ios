import SwiftUI
import Charts

public struct GrowChart: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let data: GrowChartData.Data
    private let color: Color
    private let backgroundColor: LinearGradient
    private let type: ChartType
    
    public init(
        chartData: GrowChartData,
        type: ChartType
    ) {
        self.data = chartData.data
        self.color = chartData.color
        self.backgroundColor = LinearGradient(
            colors: [
                color.opacity(0.4),
                color.opacity(0)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        self.type = type
        print(data)
    }
    
    public var body: some View {
        let balancedMax = max(data.max { $0.y < $1.y }?.y ?? 0, 0)
        ZStack {
            Chart(data, id: \.x) { i in
                LineMark(
                    x: .value("", i.x),
                    y: .value("", i.y)
                )
                .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .interpolationMethod(.cardinal(tension: 0.5))
                .foregroundStyle(color)
                AreaMark(
                    x: .value("", i.x),
                    y: .value("", i.y)
                )
                .lineStyle(.init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .interpolationMethod(.cardinal(tension: 0.5))
                .foregroundStyle(backgroundColor)
            }
            .chartXAxis {
                AxisMarks { axis in
                    if axis.index % 3 == 0 {
                        let x = data[axis.index].x
                        AxisValueLabel("\(x)")
                            .foregroundStyle(colorProvider.color(.textDarken))
                            .font(GrowFont.captionR.font)
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) { axis in
                    let value = axis.as(Int.self)!
                    AxisValueLabel {
                        Text("\(value)")
                            .foregroundStyle(colorProvider.color(.textDarken))
                            .font(GrowFont.captionR.font)
                    }
                    AxisGridLine()
                }
            }
        }
    }
}
