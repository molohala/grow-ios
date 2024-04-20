import CommunityServiceInterface

struct CommunityContentResponse: Decodable {
    let communityId: Int
    let content: String
    let createdAt: String
    let like: Int
    let writerId: Int
    let writerName: String
    let liked: Bool
}

extension CommunityContentResponse {
    func toDomain() -> CommunityContent {
        CommunityContent(
            communityId: communityId,
            content: content, createdAt: createdAt.localDateTime ?? .now,
            like: like,
            writerId: writerId,
            writerName: writerName,
            liked: liked
        )
    }
}
