public struct GithubRank {
    public let memberId: Int
    public let rank: Int
    public let commits: Int
    
    public init(memberId: Int, rank: Int, commits: Int) {
        self.memberId = memberId
        self.rank = rank
        self.commits = commits
    }
}
