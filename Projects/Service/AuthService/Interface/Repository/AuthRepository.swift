//
//  AuthRepository.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import BaseService

public protocol AuthRepository {
    func signIn(code: String) async throws -> TokenDomain
    func ressiue(refreshToken: String) async throws -> RessiueDomain
    func dAuthSignIn(id: String, pw: String) async throws -> DAuthSignInDomain
    func getToken(type: TokenType) -> String
    func setToken(_ token: String, type: TokenType)
    func removeToken(type: TokenType)
}
