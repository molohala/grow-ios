public protocol TokenDataSource {
    func setToken(_ token: String, type: TokenType)
    func getToken(type: TokenType) -> String
}
