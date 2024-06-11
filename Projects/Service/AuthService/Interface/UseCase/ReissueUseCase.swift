//
//  RessiueUseCase.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public protocol ReissueUseCase {
    func excute(refreshToken: String) async throws -> RessiueDomain
}
