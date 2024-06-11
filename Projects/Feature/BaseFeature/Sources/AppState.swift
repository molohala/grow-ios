import SwiftUI
import LanguageServiceInterface
import DesignSystem
import AuthServiceInterface
import InfoServiceInterface

@MainActor
public final class AppState: ObservableObject {
    
    @Published public var selectedView: BottomTabType = .Home
    @Published public var accessToken: String {
        didSet {
            setTokenUseCase(accessToken, type: .accessToken)
        }
    }
    @Published public var refreshToken: String {
        didSet {
            setTokenUseCase(refreshToken, type: .refreshToken)
        }
    }
    @Published public var profile: FetchFlow<Profile> = .fetching
    @Published public var baekjoon: FetchFlow<Solvedav?> = .fetching
    @Published public var github: FetchFlow<Github?> = .fetching
    @Published public var myLanguages: FetchFlow<[Language]> = .fetching
    @Published public var githubChartInfo: FetchFlow<ChartInfo?> = .fetching
    @Published public var baekjoonChartInfo: FetchFlow<ChartInfo?> = .fetching
    
    private let setTokenUseCase: any SetTokenUseCase
    private let getTokenUseCase: any GetTokenUseCase
    private let getProfileUseCase: any GetProfileUseCase
    private let getSolvedacUseCase: any GetSolvedacUseCase
    private let getGithubUseCase: any GetGithubUseCase
    private let getMyLanguagesUseCase: any GetMyLanguagesUseCase
    
    public init(
        setTokenUseCase: any SetTokenUseCase,
        getTokenUseCase: any GetTokenUseCase,
        getProfileUseCase: any GetProfileUseCase,
        getSolvedacUseCase: any GetSolvedacUseCase,
        getGithubUseCase: any GetGithubUseCase,
        getMyLanguagesUseCase: any GetMyLanguagesUseCase
    ) {
        self.setTokenUseCase = setTokenUseCase
        self.getTokenUseCase = getTokenUseCase
        self.accessToken = getTokenUseCase(type: .accessToken)
        self.refreshToken = getTokenUseCase(type: .refreshToken)
        self.getProfileUseCase = getProfileUseCase
        self.getSolvedacUseCase = getSolvedacUseCase
        self.getGithubUseCase = getGithubUseCase
        self.getMyLanguagesUseCase = getMyLanguagesUseCase
    }
    
    public func fetchProfile() async {
        do {
            profile = .fetching
            let profile = try await getProfileUseCase()
            self.profile = .success(profile)
        } catch {
            profile = .failure
        }
        async let fetchBaekjoon: () = fetchBaekjoon()
        async let fetchGithub: () = fetchGithub()
        async let fetchMyLanguages: () = fetchMyLanguages()
        _ = await [fetchBaekjoon, fetchGithub, fetchMyLanguages]
    }
    
    private func fetchBaekjoon() async {
        guard case .success(let profile) = profile else {
            baekjoon = .failure
            baekjoonChartInfo = .failure
            return
        }
        let baekjoonId = profile.socialAccounts.first { $0.socialType == .SOLVED_AC }
        guard let baekjoonId else {
            baekjoon = .success(nil)
            baekjoonChartInfo = .success(nil)
            return
        }
        do {
            baekjoon = .fetching
            let baekjoon = try await getSolvedacUseCase(name: baekjoonId.socialId)
            self.baekjoon = .success(baekjoon)
            self.baekjoonChartInfo = .success(baekjoon.weekSolves.baekjoonWeekChartInfo)
        } catch {
            baekjoon = .failure
        }
    }
    
    private func fetchGithub() async {
        guard case .success(let profile) = profile else {
            github = .failure
            githubChartInfo = .failure
            return
        }
        let githubId = profile.socialAccounts.first { $0.socialType == .GITHUB }
        guard let githubId else {
            github = .success(nil)
            githubChartInfo = .success(nil)
            return
        }
        do {
            github = .fetching
            let github = try await getGithubUseCase(name: githubId.socialId)
            self.github = .success(github)
            self.githubChartInfo = .success(github.weekCommits.githubWeekChartInfo)
        } catch {
            github = .failure
        }
    }
    
    private func fetchMyLanguages() async {
        do {
            myLanguages = .fetching
            let myLangs = try await getMyLanguagesUseCase()
            myLanguages = .success(myLangs)
        } catch {
            myLanguages = .failure
        }
    }
}
