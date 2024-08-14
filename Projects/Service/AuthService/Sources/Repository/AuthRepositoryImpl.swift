//
//  AuthRepositoryImpl.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import BaseService
import AuthServiceInterface
import CryptoKit
import SwiftUI

struct AuthRepositoryImpl: AuthRepository {
    
    private let dAuthDataSource: any DAuthDataSource
    private let authDataSource: any AuthDataSource
    private let tokenDataSource: any TokenDataSource
    
    public init(
        dAuthDataSource: any DAuthDataSource,
        authDataSource: any AuthDataSource,
        tokenDataSource: any TokenDataSource
    ) {
        self.dAuthDataSource = dAuthDataSource
        self.authDataSource = authDataSource
        self.tokenDataSource = tokenDataSource
    }
    
    func signIn(code: String) async throws -> TokenDomain {
        try await authDataSource.signIn(code: code)
    }
    
    func ressiue(refreshToken: String) async throws -> RessiueDomain {
        try await authDataSource.ressiue(refreshToken: refreshToken)
    }
    
    func dAuthSignIn(id: String, pw: String) async throws -> DAuthSignInDomain {
        let req = DAuthSignInRequest(
            id: id,
            pw: pw,
            clientId: Grow.clientId,
            redirectUrl: Grow.redirectUrl
        )
        print(req)
        return try await dAuthDataSource.dAuthSignIn(req)
    }
    
    func getToken(type: TokenType) -> String? {
        tokenDataSource.getToken(type: type)
    }
    
    func setToken(_ token: String?, type: TokenType) {
        tokenDataSource.setToken(token, type: type)
    }
    
    func removeToken(type: TokenType) {
        tokenDataSource.setToken("", type: type)
    }
    
    func remove() async throws {
        try await authDataSource.remove()
    }
}
