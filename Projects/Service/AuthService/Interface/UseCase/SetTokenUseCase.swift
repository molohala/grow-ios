public protocol SetTokenUseCase {
    func callAsFunction(_ token: String, type: TokenType)
}
