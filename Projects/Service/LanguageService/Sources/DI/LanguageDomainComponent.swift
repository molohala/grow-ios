import LanguageServiceInterface
import NeedleFoundation

public protocol LanguageDomainDependency: Dependency {}

public final class LanguageDomainComponent: Component<LanguageDomainDependency>, LanguageDomainBuildable {
    
    public var getMyLanguagesUseCase: GetMyLanguagesUseCase {
        shared {
            GetMyLanguagesUseCaseImpl(languageRepository: languageRepository)
        }
    }
    
    public var getLanguagesUseCase: GetLanguagesUseCase {
        shared {
            GetLanguageUseCasesImpl(languageRepository: languageRepository)
        }
    }
    
    public var patchMyLanguagesUseCase: PatchMyLanguagesUseCase {
        shared {
            PatchMyLanguagesUseCaseImpl(languageRepository: languageRepository)
        }
    }
    
    public var getLanguagesByMemberIdUseCase: GetLanguagesByMemberIdUseCase {
        shared {
            GetLanguagesByMemberIdUseCaseImpl(languageRepository: languageRepository)
        }
    }
    
    public var languageRepository: LanguageRepository {
        shared {
            LanguageRepositoryImpl(languageDataSource: languageDataSource)
        }
    }
    
    var languageDataSource: LanguageDataSource {
        shared {
            LanguageDataSourceImpl()
        }
    }
}
