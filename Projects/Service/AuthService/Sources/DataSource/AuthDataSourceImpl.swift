//
//  AuthDataSourceImpl.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import AuthServiceInterface
import BaseService

final class AuthDataSourceImpl: BaseRemoteDataSource<AuthDataSourceImpl>, AuthDataSource {
    
    private let url = "auth"
    
    func signIn(code: String) async throws -> TokenDomain {
        return try await requestPost(url: "\(Infinity.baseUrl)/\(url)/sign-in?code=\(code)", res: BaseResponse<TokenResponse>.self).data.toDomain()
    }
    
    func ressiue(refreshToken: String) async throws -> RessiueDomain {
        try await requestPost(url: "\(Infinity.baseUrl)/\(url)", req: ReissueRequest(refreshToken: refreshToken), res: BaseResponse<ReissueResponse>.self).data.toDomain()
    }
}
