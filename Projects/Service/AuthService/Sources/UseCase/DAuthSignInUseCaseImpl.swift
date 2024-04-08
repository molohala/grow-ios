//
//  DAuthSignInUseCaseImpl.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface

struct DAuthSignInUseCaseImpl: DAuthSignInUseCase {
    
    private let authRepository: any AuthRepository
    
    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    func excute(id: String, pw: String) async throws -> DAuthSignInDomain {
        try await authRepository.dAuthSignIn(id: id, pw: pw)
    }
}
