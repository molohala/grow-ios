import BaseService

public final class AuthService: BaseService<AuthService> {
    
    override init() {}
}


public extension AuthService {
    
    static let shared = AuthService()
    
    func dodamSignIn(_ req: DodamSignInRequest) async throws -> BaseResponse<DodamSignInResponse> {
        try await requestPost(url: "https://dauth.b1nd.com/api/auth/login/", req, BaseResponse<DodamSignInResponse>.self)
    }
    
}
