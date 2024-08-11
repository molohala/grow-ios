import BaseService

public final class NotificationApi: BaseRemoteDataSource<NotificationApi> {
    
    let path = "notification"
    public static let shared = NotificationApi()
}

public extension NotificationApi {
    
    func postFcmToken(req: PostFcmTokenReq) async throws -> BaseVoidResponse {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)", res: BaseVoidResponse.self)
    }
}

public struct PostFcmTokenReq: Encodable {
    public let fcmToken: String
    
    public init(fcmToken: String) {
        self.fcmToken = fcmToken
    }
}
