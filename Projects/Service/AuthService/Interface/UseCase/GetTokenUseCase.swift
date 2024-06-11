public protocol GetTokenUseCase {
    func callAsFunction(type: TokenType) -> String
}
