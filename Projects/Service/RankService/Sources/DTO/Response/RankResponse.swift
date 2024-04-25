import RankServiceInterface

public struct GithubRankResponse: Decodable {
    let memberId: Int
    let memberName: String
    let socialId: String
    let rank: Int
    let commits: Int
}

extension GithubRankResponse {
    func toDomain() -> GithubRank {
        GithubRank(
            memberId: memberId,
            memberName: memberName,
            socialId: socialId,
            rank: rank,
            commits: commits
        )
    }
}
