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
        case iOS
        case macOS
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
        case Block
        case BaekjoonSetting
        case GithubSetting
        case Profile
        case Setting
        case ProfileEdit
        case ProfileDetail
        case CommunityCreate
        case CommunityDetail
        case CommunityEdit
    }
    
    enum Service: String, CaseIterable {
        case Base
        case Auth
        case Language
        case Community
        case Comment
        case Like
        case Info
        case Rank
        case Block
        case Notification
    }
    
    enum Shared: String, CaseIterable {
        case GlobalThirdPartyLibrary
        case DateUtil
        case SwiftUtil
    }
    
    enum UserInterface: String, CaseIterable {
        case DesignSystem
    }
}
