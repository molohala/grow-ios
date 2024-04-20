import CommunityServiceInterface

struct CommunityResponse: Decodable {
    let community: CommunityContentResponse
    let recentComment: RecentCommentResponse?
}

extension CommunityResponse {
    func toDomain() -> Community {
        Community(
            community: community.toDomain(),
            recentComment: recentComment?.toDomain()
        )
    }
}
