//
//  RankViewModel.swift
//  RankFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public final class GithubRankViewModel: ObservableObject {
    
    @Published var rank = Array(0..<10)
    
    public init() {
        self.rank = rank
    }
}
