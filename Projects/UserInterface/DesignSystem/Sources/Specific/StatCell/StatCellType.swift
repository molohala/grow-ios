public enum StatCellType {
    case github(commit: Int?)
    case baekjoon(solved: Int?)
    
    var icon: GrowIconography {
        switch self {
        case .github: .github
        case .baekjoon: .baekjoon
        }
    }
    
    var color: GrowColorScheme {
        switch self {
        case .github: .github
        case .baekjoon: .baekjoon
        }
    }
}
