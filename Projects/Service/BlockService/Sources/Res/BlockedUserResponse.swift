import Foundation
import BlockServiceInterface
import DateUtil

struct BlockedUserResponse: Decodable {
    let createdAt: String
    let id: Int
    let name: String
    let email: String
    let bio: String
    let job: String
    
    init(createdAt: String, id: Int, name: String, email: String, bio: String, job: String) {
        self.createdAt = createdAt
        self.id = id
        self.name = name
        self.email = email
        self.bio = bio
        self.job = job
    }
}

extension BlockedUserResponse {
    func toDomain() -> BlockedUser {
        BlockedUser(
            createdAt: createdAt.localDateTime ?? .now,
            id: id,
            name: name,
            email: email,
            bio: bio,
            job: job
        )
    }
}
