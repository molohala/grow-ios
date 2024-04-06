//
//  RefreshResponse.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct ReissueResponse: Decodable {
    let accessToken: String
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
