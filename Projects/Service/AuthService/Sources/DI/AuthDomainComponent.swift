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
    public var signInUseCase: any SignInUseCase {
        shared {
            SignInUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var reissueUseCase: any ReissueUseCase {
        shared {
            RessiueUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var dAuthSignInUseCase: any DAuthSignInUseCase {
        shared {
            DAuthSignInUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var getTokenUseCase: any GetTokenUseCase {
        shared {
            GetTokenUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var setTokenUseCase: any SetTokenUseCase {
        shared {
            SetTokenUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var removeTokenUseCase: any RemoveTokenUseCase {
        shared {
            RemoveTokenUseCaseImpl(authRepository: authRepository)
        }
    }
    
    public var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(
                dAuthDataSource: dAuthDataSource,
                authDataSource: authDataSource,
                tokenDataSource: tokenDataSource
            )
        }
    }
    
    var dAuthDataSource: any DAuthDataSource {
        shared {
            DAuthDataSourceImpl()
        }
    }
    
    var authDataSource: any AuthDataSource {
        shared {
            AuthDataSourceImpl()
        }
    }
    
    var tokenDataSource: any TokenDataSource {
        shared {
            TokenDataSourceImpl()
        }
    }
}
