//
//  AuthService.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import BaseService

public final class AuthService: BaseService<AuthService> {
    override init() {}
    
    public static let shared = AuthService()
    
    private let url = "auth"
}

public extension AuthService {
    
    func signIn(code: String) async throws -> BaseResponse<TokenResponse> {
        try await requestPost(url: "\(Infinity.baseUrl)/\(url)/sign-in", res: BaseResponse<TokenResponse>.self)
    }
    
    func ressue() async throws -> BaseResponse<String> {
        try await requestPost(url: "\(Infinity.baseUrl)/\(url)", req: ReissueRequest(refreshToken: ""), res: BaseResponse<String>.self)
    }
}
