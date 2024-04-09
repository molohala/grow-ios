//
//  AppComponent+Auth.swift
//  App
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthService
import AuthServiceInterface

extension AppComponent {
    var authDomainBuildable: any AuthDomainBuildable {
        shared {
            AuthDomainComponent(parent: self)
        }
    }
}
