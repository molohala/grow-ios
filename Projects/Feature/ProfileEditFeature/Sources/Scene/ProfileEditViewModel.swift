import Foundation
import DesignSystem
import BaseFeature
import LanguageServiceInterface
import InfoServiceInterface

public final class ProfileEditViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let getMyLanguagesUseCase: any GetMyLanguagesUseCase
    private let getLanguagesUseCase: any GetLanguagesUseCase
    private let patchMyLanguagesUseCase: any PatchMyLanguagesUseCase
    private let getJobsUseCase: any GetJobsUseCase
    private let patchMyProfileUseCase: any PatchMyProfileUseCase
    
    // MARK: - States
    @Published var languages: FetchFlow<[Language]> = .fetching
    @Published var myLanguages: FetchFlow<[Language]> = .fetching
    @Published var bio = ""
    @Published var jobs: FetchFlow<[String]> = .fetching
    @Published var selectedJob = ""
    
    @Published var showFetchFailureDialog = false
    @Published var showPatchSuccessDialog = false
    @Published var showPatchFailureDialog = false
    
    public init(
        getMyLanguagesUseCase: any GetMyLanguagesUseCase,
        getLanguagesUseCase: any GetLanguagesUseCase,
        patchMyLanguagesUseCase: any PatchMyLanguagesUseCase,
        getJobsUseCase: any GetJobsUseCase,
        patchMyProfileUseCase: any PatchMyProfileUseCase
    ) {
        self.getMyLanguagesUseCase = getMyLanguagesUseCase
        self.getLanguagesUseCase = getLanguagesUseCase
        self.patchMyLanguagesUseCase = patchMyLanguagesUseCase
        self.getJobsUseCase = getJobsUseCase
        self.patchMyProfileUseCase = patchMyProfileUseCase
    }
    
    @MainActor
    func fetchLanguages() async {
        do {
            self.languages = .fetching
            let languages = try await getLanguagesUseCase()
            self.languages = .success(languages)
        } catch {
            self.languages = .failure
            showFetchFailureDialog = true
        }
    }
    
    @MainActor
    func fetchMyLanguages() async {
        do {
            myLanguages = .fetching
            let languages = try await getMyLanguagesUseCase()
            myLanguages = .success(languages)
        } catch {
            myLanguages = .failure
            showFetchFailureDialog = true
        }
    }
    
    @MainActor
    func fetchJobs() async {
        do {
            jobs = .fetching
            let languages = try await getJobsUseCase()
            jobs = .success(languages)
        } catch {
            jobs = .failure
            showFetchFailureDialog = true
        }
    }
    
    func updateMyLanguages(lang: Language) {
        guard case .success(var myLangs) = myLanguages else {
            return
        }
        
        if myLangs.contains(lang) {
            myLangs.removeAll { $0 == lang }
        } else {
            myLangs.append(lang)
        }
        myLanguages = .success(myLangs)
    }
    
    @MainActor
    func completeSetting() async {
        guard case .success(let myLangs) = myLanguages else {
            return
        }
        do {
            try await patchMyLanguagesUseCase(.init(langs: myLangs.map { $0.id }))
            try await patchMyProfileUseCase(.init(bio: bio, job: selectedJob))
            showPatchSuccessDialog = true
        } catch {
            showPatchFailureDialog = true
        }
    }
}
