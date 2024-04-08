//
//  AuthDomainCompontny.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import NeedleFoundation
import AuthServiceInterface

public protocol AuthDomainDependency: Dependency {
    
}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainBuildable {
    public var signInUseCase: SignInUseCase {
        SignInUseCaseImpl(authRepository: authRepository)
    }
    
    public var reissueUseCase: ReissueUseCase {
        RessiueUseCaseImpl(authRepository: authRepository)
    }
    
    public var dAuthSignInUseCase: DAuthSignInUseCase {
        DAuthSignInUseCaseImpl(authRepository: authRepository)
    }
    
    var authRepository: AuthRepository {
        AuthRepositoryImpl(
            dAuthDataSource: dAuthDataSource, 
            authDataSource: authDataSource
        )
    }
    
    var dAuthDataSource: DAuthDataSource {
        DAuthDataSourceImpl()
    }
    
    var authDataSource: AuthDataSource {
        AuthDataSourceImpl()
    }
    
}
