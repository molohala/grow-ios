//
//  AppState.swift
//  BaseFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public final class AppState: ObservableObject {
    
    @Published public var selectedView: MainFlow = .Home
    
    public init() {}
}
