import Foundation
import InfoServiceInterface
import DesignSystem
import BaseFeature
import LanguageServiceInterface

public final class ProfileDetailViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let getGithubUseCase: any GetGithubUseCase
    private let getProfileByIdUseCase: any GetProfileByIdUseCase
    private let getSolvedacUseCase: any GetSolvedacUseCase
    private let getLanguagesByMemberIdUseCase: any GetLanguagesByMemberIdUseCase
    
    // MARK: - Properties
    private let memberId: Int
    
    // MARK: - States
    @Published var profile: FetchFlow<Profile> = .fetching
    @Published var github: FetchFlow<Github?> = .fetching
    @Published var baekjoon: FetchFlow<Solvedav?> = .fetching
    @Published var languages: FetchFlow<[Language]> = .fetching
    @Published var githubChartInfo: FetchFlow<ChartInfo?> = .fetching
    @Published var baekjoonChartInfo: FetchFlow<ChartInfo?> = .fetching
    
    public init(
        getGithubUseCase: any GetGithubUseCase,
        getProfileByIdUseCase: any GetProfileByIdUseCase,
        getSolvedacUseCase: any GetSolvedacUseCase,
        getLanguagesByMemberIdUseCase: any GetLanguagesByMemberIdUseCase,
        memberId: Int
    ) {
        self.getGithubUseCase = getGithubUseCase
        self.getProfileByIdUseCase = getProfileByIdUseCase
        self.getSolvedacUseCase = getSolvedacUseCase
        self.getLanguagesByMemberIdUseCase = getLanguagesByMemberIdUseCase
        self.memberId = memberId
    }
    
    @MainActor
    func fetchProfile() async {
        do {
            profile = .fetching
            let profile = try await getProfileByIdUseCase(memberId: memberId)
            self.profile = .success(profile)
            async let fetchProfile: () = await fetchGithub()
            async let fetchBaekjoon: () = await fetchBaekjoon()
            async let fetchLanguages: () = await fetchLanguage()
            _ = await [fetchProfile, fetchBaekjoon, fetchLanguages]
        } catch {
            profile = .failure
        }
    }
    
    @MainActor
    func fetchBaekjoon() async {
        guard case .success(let profile) = profile else {
            baekjoon = .failure
            baekjoonChartInfo = .failure
            return
        }
        guard let baekjoonId = profile.baekjoonId else {
            baekjoon = .success(nil)
            baekjoonChartInfo = .success(nil)
            return
        }

        do {
            self.baekjoon = .fetching
            let baekjoon = try await getSolvedacUseCase(name: baekjoonId)
            self.baekjoon = .success(baekjoon)
            self.baekjoonChartInfo = .success(baekjoon.weekSolves.baekjoonWeekChartInfo)
        } catch {
            self.baekjoon = .failure
        }
    }
    
    @MainActor
    func fetchGithub() async {
        guard case .success(let profile) = profile else {
            github = .failure
            githubChartInfo = .failure
            return
        }
        guard let githubId = profile.githubId else {
            github = .success(nil)
            githubChartInfo = .success(nil)
            return
        }

        do {
            self.github = .fetching
            let github = try await getGithubUseCase(name: githubId)
            self.github = .success(github)
            githubChartInfo = .success(github.weekCommits.githubWeekChartInfo)
        } catch {
            self.github = .failure
        }
    }
    
    @MainActor
    func fetchLanguage() async {
        do {
            languages = .fetching
            let languages = try await getLanguagesByMemberIdUseCase(memberId: memberId)
            self.languages = .success(languages)
        } catch {
            languages = .failure
        }
    }
}
