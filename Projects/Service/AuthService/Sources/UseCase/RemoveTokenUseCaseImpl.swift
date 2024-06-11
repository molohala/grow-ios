import AuthServiceInterface

class RemoveTokenUseCaseImpl: RemoveTokenUseCase {
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func callAsFunction(type: TokenType) {
        authRepository.removeToken(type: type)
    }
}
