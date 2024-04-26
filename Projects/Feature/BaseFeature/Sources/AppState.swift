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
    
    public enum FetchFlow {
        case fetching
        case success
        case failure
    }
    
    @Published public var selectedView: MainFlow = .Home
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
    @Published public var profile: Profile?
    @Published public var solvedac: Solvedav?
    @Published public var solvedacFlow: FetchFlow = .fetching
    @Published public var github: Github?
    @Published public var githubFlow: FetchFlow = .fetching
    
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
        fetchProfile()
    }
    
    public func fetchProfile() {
        Task {
            profile = try? await getProfileUseCase()
            if let profile {
                // handle solvedac
                let solvedavId = profile.socialAccounts.first { $0.socialType == .SOLVED_AC }
                guard let solvedavId else {
                    solvedacFlow = .failure
                    return
                }
                do {
                    solvedac = try await getSolvedacUseCase(name: solvedavId.socialId)
                    solvedacFlow = .success
                } catch {
                    solvedacFlow = .failure
                }
                
                // handle github
                let githubId = profile.socialAccounts.first { $0.socialType == .GITHUB }
                guard let githubId else { 
                    githubFlow = .failure
                    return
                }
                do {
                    github = try await getGithubUseCase(name: githubId.socialId)
                    githubFlow = .success
                } catch {
                    githubFlow = .failure
                }
            }
        }
    }
}
