//
//  AuthDomainCompontny.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import NeedleFoundation
import AuthServiceInterface

public protocol AuthDomainDependency: Dependency {}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainBuildable {
    public var signInUseCase: SignInUseCase {
        shared {
            SignInUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var reissueUseCase: ReissueUseCase {
        shared {
            RessiueUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var dAuthSignInUseCase: DAuthSignInUseCase {
        shared {
            DAuthSignInUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var authRepository: AuthRepository {
        shared {
            AuthRepositoryImpl(
                dAuthDataSource: dAuthDataSource,
                authDataSource: authDataSource
            )
        }
    }
    
    var dAuthDataSource: DAuthDataSource {
        shared {
            DAuthDataSourceImpl()
        }
    }
    
    var authDataSource: AuthDataSource {
        shared {
            AuthDataSourceImpl()
        }
    }
}
