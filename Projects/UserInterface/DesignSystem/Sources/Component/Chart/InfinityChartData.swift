import SwiftUI
import DateUtil

public struct InfinityChartData {
    
    public typealias Data = [(x: String, y: Int)]
    
    public let data: [(x: String, y: Int)]
    public let color: Color
    
    public init(data: [(x: String, y: Int)], color: Color) {
        self.data = data
        self.color = color
    }
}

public extension InfinityChartData {
    static let dummy: Self.Data = Date.datesForWeek.map {
        (x: $0.monthPerDay ?? "", y: .random(in: 0..<30))
    }
}
