import CommunityServiceInterface

struct CommunityResponse: Decodable {
    let communityId: Int
    let content: String
    let createdAt: String
    let like: Int
    let writer: String
}

extension CommunityResponse {
    func toDomain() -> Community {
        Community(
            communityId: communityId,
            content: content,
            createdAt: createdAt.date ?? .now,
            like: like,
            writer: writer
        )
    }
}
