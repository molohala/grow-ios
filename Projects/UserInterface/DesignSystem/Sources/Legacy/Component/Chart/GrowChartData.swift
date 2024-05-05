import SwiftUI
import DateUtil

public struct GrowChartData {
    
    public typealias Data = [(x: String, y: Int)]
    
    public let data: Data
    public let color: Color
    
    public init(data: Data, color: Color) {
        self.data = data
        self.color = color
    }
}

public extension GrowChartData {
    static let dummy: Self.Data = Date.datesForWeek.map {
        (x: $0.monthPerDay ?? "", y: .random(in: 0..<30))
    }
}
