//
//  UpdateRankResponse.swift
//  RankService
//
//  Created by hhhello0507 on 8/13/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import RankServiceInterface
import DateUtil

public struct UpdateRankResponse: Decodable {
    let updatedAt: String
    let ranks: [RankResponse]
}

extension UpdateRankResponse {
    func toDomain() -> UpdateRank {
        UpdateRank(
            updatedAt: updatedAt.localDateTime,
            ranks: ranks.map { $0.toDomain() }
        )
    }
}
