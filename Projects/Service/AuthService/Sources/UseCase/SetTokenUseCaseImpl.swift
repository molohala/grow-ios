import AuthServiceInterface

class SetTokenUseCaseImpl: SetTokenUseCase {
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func callAsFunction(_ token: String?, type: TokenType) {
        authRepository.setToken(token, type: type)
    }
}
