//
//  DAuthSignInDomain.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct DAuthSignInDomain {
    public let name: String
    public let profileImage: String
    public let location: String
    
    public init(name: String, profileImage: String, location: String) {
        self.name = name
        self.profileImage = profileImage
        self.location = location
    }
}
