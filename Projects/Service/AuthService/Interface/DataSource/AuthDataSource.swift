//
//  AuthDataSource.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

public protocol AuthDataSource {
    func signIn(code: String) async throws -> TokenDomain
    func ressiue(refreshToken: String) async throws -> RessiueDomain
    func remove() async throws
}
