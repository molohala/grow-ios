//
//  AppState.swift
//  BaseFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
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
    @Published public var solvedac: FetchFlow<Solvedav> = .fetching
    @Published public var github: FetchFlow<Github> = .fetching
    
    private let setTokenUseCase: any SetTokenUseCase
    private let getTokenUseCase: any GetTokenUseCase
    private let getProfileUseCase: any GetProfileUseCase
    private let getSolvedacUseCase: any GetSolvedacUseCase
    private let getGithubUseCase: any GetGithubUseCase
    
    public init(
        setTokenUseCase: any SetTokenUseCase,
        getTokenUseCase: any GetTokenUseCase,
        getProfileUseCase: any GetProfileUseCase,
        getSolvedacUseCase: any GetSolvedacUseCase,
        getGithubUseCase: any GetGithubUseCase
    ) {
        self.setTokenUseCase = setTokenUseCase
        self.getTokenUseCase = getTokenUseCase
        self.accessToken = getTokenUseCase(type: .accessToken)
        self.refreshToken = getTokenUseCase(type: .refreshToken)
        self.getProfileUseCase = getProfileUseCase
        self.getSolvedacUseCase = getSolvedacUseCase
        self.getGithubUseCase = getGithubUseCase
    }
    
    public func fetchProfile() {
        Task {
            do {
                profile = .fetching
                let profile = try await getProfileUseCase()
                self.profile = .success(profile)
            } catch {
                profile = .failure
            }
            fetchSolvedac()
            fetchGithub()
        }
    }
    
    private func fetchSolvedac() {
        Task {
            guard case .success(let profile) = profile else {
                solvedac = .failure
                return
            }
            let solvedavId = profile.socialAccounts.first { $0.socialType == .SOLVED_AC }
            guard let solvedavId else {
                solvedac = .failure
                return
            }
            do {
                solvedac = .fetching
                let solvedac = try await getSolvedacUseCase(name: solvedavId.socialId)
                self.solvedac = .success(solvedac)
            } catch {
                solvedac = .failure
            }
        }
    }
    
    private func fetchGithub() {
        Task {
            guard case .success(let profile) = profile else {
                github = .failure
                return
            }
            let githubId = profile.socialAccounts.first { $0.socialType == .GITHUB }
            guard let githubId else {
                github = .failure
                return
            }
            do {
                github = .fetching
                let github = try await getGithubUseCase(name: githubId.socialId)
                self.github = .success(github)
            } catch {
                github = .failure
            }
        }
    }
}
