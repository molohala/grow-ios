import AuthServiceInterface
import Foundation

class TokenDataSourceImpl: TokenDataSource {
    func setToken(_ token: String, type: TokenType) {
        UserDefaults.standard.setValue(token, forKey: type.rawValue)
    }
    
    func getToken(type: TokenType) -> String {
        UserDefaults.standard.string(forKey: type.rawValue) ?? ""
    }
}
