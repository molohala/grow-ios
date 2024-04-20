import Foundation
import DesignSystem

public struct Github {
    public var avatarUrl: String
    public var bio: String
    public var totalCommits: Int
    public var weekCommits: [Commit]
    public var todayCommits: Commit
    
    public init(avatarUrl: String, bio: String, totalCommits: Int, weekCommits: [Commit], todayCommits: Commit) {
        self.avatarUrl = avatarUrl
        self.bio = bio
        self.totalCommits = totalCommits
        self.weekCommits = weekCommits
        self.todayCommits = todayCommits
    }
}

public struct Commit {
    public var date: Date
    public var contributionCount: Int
    public init(date: Date, contributionCount: Int) {
        self.date = date
        self.contributionCount = contributionCount
    }
}

public extension [Commit] {
    var githubWeekChartInfo: ChartInfo {
        .init(
            title: "\(self.map { $0.contributionCount }.reduce(0, +))",
            subtitle: "이번주에 한 커밋",
            subject: ChartType.github.rawValue,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", y: $0.contributionCount) },
                color: .orange500
            )
        )
    }
}
