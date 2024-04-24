import InfoServiceInterface
import DateUtil

struct ProfileResponse: Decodable {
    let id: Int
    let email: String
    let name: String
    let createdAt: String
    let socialAccounts: [SocialResponse]
}

struct SocialResponse: Decodable {
    let socialId: String
    let socialType: String
}

extension ProfileResponse {
    func toDomain() -> Profile {
        Profile(
            id: id,
            email: email,
            name: name,
            createdAt: createdAt.localDateTime ?? .now,
            socialAccounts: socialAccounts.map { $0.toDomain() }
        )
    }
}

extension SocialResponse {
    func toDomain() -> Social {
        Social(socialId: socialId, socialType: SocialType(rawValue: socialType) ?? .GITHUB)
    }
}
