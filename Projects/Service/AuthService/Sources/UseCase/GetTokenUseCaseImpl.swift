import AuthServiceInterface

class GetTokenUseCaseImpl: GetTokenUseCase {
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func callAsFunction(type: TokenType) -> String {
        authRepository.getToken(type: type)
    }
}
