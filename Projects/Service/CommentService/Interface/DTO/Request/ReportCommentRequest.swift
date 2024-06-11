public struct ReportCommentRequest: Encodable {
    public let reason: String
    
    public init(reason: String) {
        self.reason = reason
    }
}
