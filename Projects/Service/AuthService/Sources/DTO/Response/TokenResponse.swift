//
//  TokenResponse.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface

public struct TokenResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}

extension TokenResponse {
    func toDomain() -> TokenDomain {
        TokenDomain(
            refreshToken: refreshToken,
            accessToken: accessToken
        )
    }
}
