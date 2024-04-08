//
//  DodamSignInResponse.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface

public struct DAuthSignInResponse: Decodable {
    let name: String
    let profileImage: String
    let location: String
}

extension DAuthSignInResponse {
    func toDomain() -> DAuthSignInDomain {
        DAuthSignInDomain(
            name: name,
            profileImage: profileImage,
            location: location
        )
    }
}
