import RankServiceInterface

public struct RankResponse: Decodable {
    let memberId: Int
    let memberName: String
    let socialId: String
    let rank: Int
    let count: Int
}

extension RankResponse {
    func toDomain() -> Rank {
        Rank(
            memberId: memberId,
            memberName: memberName,
            socialId: socialId,
            rank: rank,
            count: count
        )
    }
}
