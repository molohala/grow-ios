import Foundation

public struct BlockedUser {
    public let createdAt: Date
    public let id: Int
    public let name: String
    public let email: String
    public let bio: String
    public let job: String
    
    public init(createdAt: Date, id: Int, name: String, email: String, bio: String, job: String) {
        self.createdAt = createdAt
        self.id = id
        self.name = name
        self.email = email
        self.bio = bio
        self.job = job
    }
}
