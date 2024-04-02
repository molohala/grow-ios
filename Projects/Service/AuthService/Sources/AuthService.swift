import BaseService
import Foundation
import Crypto

public final class AuthService: BaseService<AuthService> {
    
    override init() {}
}

public extension AuthService {
    
    static let shared = AuthService()
    
    func dodamSignIn(id: String, pw: String) async throws -> BaseResponse<DodamSignInResponse> {
        
        let encryptedPw = SHA512.hash(data: Data(pw.utf8))
        let hashedPw = encryptedPw.compactMap { String(format: "%02x", $0) }.joined()
        
        let req = DodamSignInRequest(id: id,
                                     pw: hashedPw,
                                     clientId: Dodam.clientId,
                                     redirectUrl: Dodam.redirectUrl)
        
        return try await requestPost(url: "https://dauth.b1nd.com/api/auth/login/", req, BaseResponse<DodamSignInResponse>.self)
    }
}
