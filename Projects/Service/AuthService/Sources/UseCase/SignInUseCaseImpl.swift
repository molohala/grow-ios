//
//  SignInUseCaseImpl.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface

struct SignInUseCaseImpl: SignInUseCase {
    
    private let authRepository: any AuthRepository
    
    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    func excute(code: String) async throws -> TokenDomain {
        try await authRepository.signIn(code: code)
    }
}
