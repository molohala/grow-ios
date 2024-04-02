//
//  DodamSignInRequest.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct DodamSignInRequest: Encodable {
    public let id: String
    public let pw: String
    public let clientId: String
    public let redirectUrl: String
    
    public init(id: String, pw: String, clientId: String, redirectUrl: String) {
        self.id = id
        self.pw = pw
        self.clientId = clientId
        self.redirectUrl = redirectUrl
    }
}
