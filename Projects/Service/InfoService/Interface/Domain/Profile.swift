import Foundation

public struct Profile: Equatable {
    public static func == (lhs: Profile, rhs: Profile) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id: Int
    public let email: String
    public let name: String
    public let createdAt: Date
    public let socialAccounts: [Social]
    
    public init(id: Int, email: String, name: String, createdAt: Date, socialAccounts: [Social]) {
        self.id = id
        self.email = email
        self.name = name
        self.createdAt = createdAt
        self.socialAccounts = socialAccounts
    }
}

public extension Profile {
    var githubId: String? {
        self.socialAccounts.first { social in
            social.socialType == .GITHUB
        }?.socialId
    }
    
    var baekjoonId: String? {
        self.socialAccounts.first { social in
            social.socialType == .SOLVED_AC
        }?.socialId
    }
}

public struct Social {
    public let socialId: String
    public let socialType: SocialType
    
    public init(socialId: String, socialType: SocialType) {
        self.socialId = socialId
        self.socialType = socialType
    }
}

public enum SocialType: String, RawRepresentable {
    case SOLVED_AC
    case GITHUB
}
