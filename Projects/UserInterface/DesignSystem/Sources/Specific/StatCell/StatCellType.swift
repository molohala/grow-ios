import MyDesignSystem

public enum StatCellType {
    case github(commit: Int?)
    case baekjoon(solved: Int?)
    
    var icon: MyIconography {
        switch self {
        case .github: .github
        case .baekjoon: .baekjoon
        }
    }
    
    var color: MyColorScheme {
        switch self {
        case .github: .github
        case .baekjoon: .baekjoon
        }
    }
}
