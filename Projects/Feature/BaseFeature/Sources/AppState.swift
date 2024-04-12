//
//  AppState.swift
//  BaseFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import AuthServiceInterface

public final class AppState: ObservableObject {
    
    @Published public var selectedView: MainFlow = .Home
    @Published public var accessToken: String? {
        didSet {
            setTokenUseCase(accessToken, type: .accessToken)
        }
    }
    
    private let setTokenUseCase: any SetTokenUseCase
    private let getTokenUseCase: any GetTokenUseCase
    
    public init(
        setTokenUseCase: any SetTokenUseCase,
        getTokenUseCase: any GetTokenUseCase
    ) {
        self.setTokenUseCase = setTokenUseCase
        self.getTokenUseCase = getTokenUseCase
        self.accessToken = getTokenUseCase(type: .accessToken)
    }
}
