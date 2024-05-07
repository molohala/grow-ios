import SwiftUI
import DateUtil

public struct GrowChartData: Equatable {
    public static func == (lhs: GrowChartData, rhs: GrowChartData) -> Bool {
        lhs.id == rhs.id
    }
    
    public typealias Data = [(x: String, y: Int)]
    
    private let id: String = UUID().uuidString
    public let data: Data
    public let color: Color
    
    public init(data: Data, color: Color) {
        self.data = data
        self.color = color
    }
    
    public var sum: Int {
        self.data.map { $0.y }.reduce(0, +)
    }
}

public extension GrowChartData {
    static let dummy: Self.Data = Date.datesForWeek.map {
        (x: $0.monthPerDay ?? "", y: .random(in: 0..<30))
    }
}
