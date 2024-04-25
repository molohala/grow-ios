import RankServiceInterface

public struct RankResponse: Decodable {
    let memberId: Int
    let rank: Int
    let commits: Int
}

extension RankResponse {
    func toDomain() -> Rank {
        Rank(memberId: memberId, rank: rank, commits: commits)
    }
}
