public struct ReportCommunityRequest: Encodable {
    public let reason: String
    
    public init(reason: String) {
        self.reason = reason
    }
}
