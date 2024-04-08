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
    
    public init(
        dAuthDataSource: any DAuthDataSource,
        authDataSource: any AuthDataSource
    ) {
        self.dAuthDataSource = dAuthDataSource
        self.authDataSource = authDataSource
    }
    
    func signIn(code: String) async throws -> TokenDomain {
        try await authDataSource.signIn(code: code)
    }
    
    func ressiue(refreshToken: String) async throws -> RessiueDomain {
        try await authDataSource.ressiue(refreshToken: refreshToken)
    }
    
    func dAuthSignIn(id: String, pw: String) async throws -> DAuthSignInDomain {
        
        let encryptedPw = SHA512.hash(data: Data(pw.utf8))
        let hashedPw = encryptedPw.compactMap { String(format: "%02x", $0) }.joined()
        
        let req = DAuthSignInRequest(id: id,
                                     pw: hashedPw,
                                     clientId: DAuth.clientId,
                                     redirectUrl: DAuth.redirectUrl)
        return try await dAuthDataSource.dAuthSignIn(req)
    }
}
