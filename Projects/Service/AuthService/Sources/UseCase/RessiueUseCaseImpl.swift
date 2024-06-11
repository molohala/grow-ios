//
//  RessiueUseCaseImpl.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface

struct RessiueUseCaseImpl: ReissueUseCase {
    
    private let authRepository: any AuthRepository
    
    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    func excute(refreshToken: String) async throws -> RessiueDomain {
        try await authRepository.ressiue(refreshToken: refreshToken)
    }
}
