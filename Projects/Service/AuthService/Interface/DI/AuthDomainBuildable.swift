//
//  AuthDomainBuildable.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public protocol AuthDomainBuildable {
    var signInUseCase: any SignInUseCase { get }
    var reissueUseCase: any ReissueUseCase { get }
    var dAuthSignInUseCase: any DAuthSignInUseCase { get }
    var getTokenUseCase: any GetTokenUseCase { get }
    var setTokenUseCase: any SetTokenUseCase { get }
    var removeTokenUseCase: any RemoveTokenUseCase { get }
}
