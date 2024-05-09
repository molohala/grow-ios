public struct PatchMyProfileRequest: Encodable {
    let bio: String
    let job: String
    
    public init(
        bio: String,
        job: String
    ) {
        self.bio = bio
        self.job = job
    }
}
