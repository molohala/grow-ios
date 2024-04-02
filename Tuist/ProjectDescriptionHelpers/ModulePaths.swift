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
        case BaseFeature
        case SignInFeature
        case HomeFeature
        case RankFeature
        case ProfileFeature
    }
    
    enum Service: String, CaseIterable {
        case BaseService
        case AuthService
    }
    
    enum Shared: String, CaseIterable {
        case GlobalThirdPartyLibrary
    }
    
    enum UserInterface: String, CaseIterable {
        case DesignSystem
    }
}
