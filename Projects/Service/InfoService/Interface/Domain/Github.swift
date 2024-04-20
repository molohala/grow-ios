import Foundation

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
