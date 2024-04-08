//
//  RefreshResponse.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface

public struct ReissueResponse: Decodable {
    let accessToken: String
}

extension ReissueResponse {
    func toDomain() -> RessiueDomain {
        RessiueDomain(accessToken: accessToken)
    }
}
