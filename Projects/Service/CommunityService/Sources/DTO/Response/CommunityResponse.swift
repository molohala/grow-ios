import CommunityServiceInterface

struct CommunityResponse: Decodable {
    let communityId: Int
    let content: String
    let createdAt: String
    let like: Int
    let writerId: Int
    let writerName: String
    let liked: Bool
}

extension CommunityResponse {
    func toDomain() -> Community {
        Community(
            communityId: communityId,
            content: content,
            createdAt: createdAt.date ?? .now,
            like: like,
            writerId: writerId,
            writerName: writerName,
            liked: liked
        )
    }
}
