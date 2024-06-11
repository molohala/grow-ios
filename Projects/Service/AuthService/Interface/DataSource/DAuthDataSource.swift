//
//  DAuthDataSource.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public protocol DAuthDataSource {
    func dAuthSignIn(_ req: DAuthSignInRequest) async throws -> DAuthSignInDomain
}
