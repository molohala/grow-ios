//
//  DAuthDataSourceImpl.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthServiceInterface
import Foundation
import CryptoKit
import BaseService

final class DAuthDataSourceImpl: BaseRemoteDataSource<DAuthDataSourceImpl>, DAuthDataSource {
    
    func dAuthSignIn(_ req: DAuthSignInRequest) async throws -> DAuthSignInDomain {
        try await requestPost(url: "https://dauth.b1nd.com/api/auth/login/", req: req, res: BaseResponse<DAuthSignInResponse>.self).data.toDomain()
    }
}
