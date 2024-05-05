//
//  GrowJob.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct GrowJob: View {
    
    private let type: GrowJobType
    
    public init(
        _ type: GrowJobType
    ) {
        self.type = type
    }
    
    public var body: some View {
        Text(type.rawValue)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundStyle(type.color)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(type.background)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
