import Foundation
import InfoServiceInterface
import DateUtil

public struct SolvedavResponse: Decodable {
    public var name: String
    public var avatarUrl: String?
    public var bio: String
    var tier, rating, maxStreak, totalRank, totalSolves: Int
    var weekSolves: [SolveResponse]
    var todaySolves: SolveResponse
}

extension SolvedavResponse {
    func toDomain() -> Solvedav {
        Solvedav(
            name: name,
            avatarUrl: avatarUrl,
            bio: bio,
            tier: tier,
            rating: rating, 
            maxStreak: maxStreak,
            totalRank: totalRank,
            totalSolves: totalSolves,
            weekSolves: weekSolves.map { $0.toDomain() }, 
            todaySolves: todaySolves.toDomain()
        )
    }
}

public struct SolveResponse: Decodable {
    let date: String
    let solvedCount: Int
    let keepStreakReason: String?
}

extension SolveResponse {
    func toDomain() -> Solve {
        Solve(date: date.localDateTime ?? .now, solvedCount: solvedCount, keepStreakReason: keepStreakReason)
    }
}
