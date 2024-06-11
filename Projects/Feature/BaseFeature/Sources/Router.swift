//
//  Router.swift
//  BaseFeature
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI

public final class Router: ObservableObject {
    @Published public var navPath = NavigationPath()
    public init() {}

    public func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }

    public func popToStack() {
        navPath.removeLast()
    }

    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
