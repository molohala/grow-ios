//
//  UpdateRank.swift
//  RankService
//
//  Created by hhhello0507 on 8/13/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct UpdateRank: Hashable {
    public let updatedAt: Date?
    public var ranks: [Rank]
    
    public init(updatedAt: Date?, ranks: [Rank]) {
        self.updatedAt = updatedAt
        self.ranks = ranks
    }
}
