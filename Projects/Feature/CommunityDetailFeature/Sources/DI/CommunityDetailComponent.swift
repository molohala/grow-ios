//
//  CommunityDetailCompontny.swift
//  CommunityDetailFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import CommunityDetailFeatureInterface

public protocol CommunityDetailDependency: Dependency {
    
}

public final class CommunityDetailComponent: Component<CommunityDetailDependency>, CommunityDetailBuildable {
    public func makeView() -> some View {
        CommunityDetailView()
    }
}
