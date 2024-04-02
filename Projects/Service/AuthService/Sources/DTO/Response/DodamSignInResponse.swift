//
//  DodamSignInResponse.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct DodamSignInResponse: Decodable {
    public let name: String
    public let profileImage: String
    public let location: String
}
