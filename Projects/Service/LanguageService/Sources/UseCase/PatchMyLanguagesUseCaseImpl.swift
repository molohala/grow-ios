import LanguageServiceInterface

class PatchMyLanguagesUseCaseImpl: PatchMyLanguagesUseCase {
    private let languageRepository: any LanguageRepository
    init(languageRepository: any LanguageRepository) {
        self.languageRepository = languageRepository
    }
    func callAsFunction(_ req: PatchMyLanguagesRequest) async throws {
        try await languageRepository.patchMyLanguages(req)
    }
}
