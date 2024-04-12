//
//  BaseResponse.swift
//  BaseService
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct BaseResponse<Data: Decodable>: Decodable {
    public let status: Int
    public let message: String
    public let data: Data
}

public struct BaseVoidResponse: Decodable {
    public let status: Int
    public let message: String
}
