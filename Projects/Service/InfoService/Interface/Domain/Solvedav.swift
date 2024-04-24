import Foundation

public struct Solvedav {
    public var name: String
    public var avatarUrl: String?
    public var bio: String
    public var tier, rating, maxStreak, totalRank, totalSolves: Int
    public var weekSolves: [Solve]
    public var todaySolves: Solve
    public init(
        name: String,
        avatarUrl: String?,
        bio: String,
        tier: Int,
        rating: Int,
        maxStreak: Int,
        totalRank: Int,
        totalSolves: Int,
        weekSolves: [Solve], 
        todaySolves: Solve
    ) {
        self.name = name
        self.avatarUrl = avatarUrl
        self.bio = bio
        self.tier = tier
        self.rating = rating
        self.maxStreak = maxStreak
        self.totalRank = totalRank
        self.totalSolves = totalSolves
        self.weekSolves = weekSolves
        self.todaySolves = todaySolves
    }
}

public struct Solve {
    public let date: Date
    public let solvedCount: Int
    public let keepStreakReason: String?
    public init(date: Date, solvedCount: Int, keepStreakReason: String?) {
        self.date = date
        self.solvedCount = solvedCount
        self.keepStreakReason = keepStreakReason
    }
}
