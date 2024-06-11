public struct SocialIdRequest: Encodable {
    let socialId: String
    
    public init(socialId: String) {
        self.socialId = socialId
    }
}
