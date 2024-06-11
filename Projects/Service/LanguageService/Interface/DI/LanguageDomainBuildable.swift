public protocol LanguageDomainBuildable {
    var getMyLanguagesUseCase: GetMyLanguagesUseCase { get }
    var getLanguagesUseCase: GetLanguagesUseCase { get }
    var patchMyLanguagesUseCase: PatchMyLanguagesUseCase { get }
    var getLanguagesByMemberIdUseCase: GetLanguagesByMemberIdUseCase { get }
}
