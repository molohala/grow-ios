import XCTest
import BaseService

class BaseTest: XCTest {
    
    func testGetRequest() {
        APIClient.request(.init(url: "auth/test", method: .post, response: BaseResponse<TokenResponse>.self))
            .map { $0.data }
            .sink { sub in
                print(sub)
            } receiveValue: { sub in
                print(sub)
            }
    }
}

struct TokenResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}
