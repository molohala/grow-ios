//
//  ModulePaths.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 3/26/24.
//

import Foundation

public enum ModulePaths {
    case app(App)
    case feature(Feature)
    case service(Service)
    case shared(Shared)
    case userInterface(UserInterface)
}

public extension ModulePaths {
    
    enum App: String, CaseIterable {
        case App
    }
    
    enum Feature: String, CaseIterable {
        case Base
        case Root
        case SignIn
        case Main
        case Home
        case Community
        case GithubRank
        case BaekjoonRank
        case BaekjoonSetting
        case GithubSetting
        case Profile
        case Setting
        case ProfileEdit
        case ProfileDetail
        case CommunityCreate
        case CommunityDetail
    }
    
    enum Service: String, CaseIterable {
        case Base
        case Auth
    }
    
    enum Shared: String, CaseIterable {
        case GlobalThirdPartyLibrary
    }
    
    enum UserInterface: String, CaseIterable {
        case DesignSystem
    }
}
