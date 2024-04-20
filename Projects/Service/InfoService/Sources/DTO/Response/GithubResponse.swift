import Foundation
import InfoServiceInterface
import DateUtil

struct GithubResponse: Decodable {
    var avatarUrl: String
    var bio: String
    var totalCommits: Int
    var weekCommits: [CommitResponse]
    var todayCommits: CommitResponse
}

extension GithubResponse {
    func toDomain() -> Github {
        Github(avatarUrl: avatarUrl, bio: bio, totalCommits: totalCommits, weekCommits: weekCommits.map { $0.toDomain() }, todayCommits: todayCommits.toDomain())
    }
}

struct CommitResponse: Decodable {
    var date: String
    var contributionCount: Int
}

extension CommitResponse {
    func toDomain() -> Commit {
        Commit(date: date.localDate ?? .now, contributionCount: contributionCount)
    }
}
