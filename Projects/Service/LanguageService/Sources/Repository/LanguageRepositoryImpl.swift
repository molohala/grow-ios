import LanguageServiceInterface

class LanguageRepositoryImpl: LanguageRepository {
    
    private let languageDataSource: any LanguageDataSource
    
    init(
        languageDataSource: any LanguageDataSource
    ) {
        self.languageDataSource = languageDataSource
    }
    
    func getMyLanguages() async throws -> [Language] {
        try await languageDataSource.getMyLanguages()
    }
    
    func getLanguages() async throws -> [Language] {
        try await languageDataSource.getLanguages()
    }
    
    func patchMyLanguages(_ req: PatchMyLanguagesRequest) async throws {
        try await languageDataSource.patchMyLanguages(req)
    }
    
    func getLanguagesByMemberId(memberId: Int) async throws -> [Language] {
        try await languageDataSource.getLanguagesByMemberId(memberId: memberId)
    }
}
