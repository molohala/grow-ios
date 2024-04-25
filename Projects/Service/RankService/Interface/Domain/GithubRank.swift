public struct GithubRank: Hashable {
    public let memberId: Int
    public let memberName: String
    public let socialId: String
    public let rank: Int
    public let commits: Int
    
    public init(
        memberId: Int,
        memberName: String,
        socialId: String,
        rank: Int,
        commits: Int
    ) {
        self.memberId = memberId
        self.memberName = memberName
        self.socialId = socialId
        self.rank = rank
        self.commits = commits
    }
}
