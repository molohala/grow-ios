//
//  InfinityTabCell.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import BaseFeature

struct InfinityTabCell: View {
    
    let type: MainFlow
    let isSelected: Bool
    
    init(type: MainFlow, isSelected: Bool) {
        self.type = type
        self.isSelected = isSelected
    }
    
    var body: some View {
        VStack {
            type.image
                .renderingMode(.template)
                .resizable()
                .frame(width: 28, height: 28)
                .padding(.top, 4)
                .foregroundStyle(isSelected ? .blue : .gray.opacity(0.6))
            Text(type.name)
                .font(.caption2)
                .foregroundStyle(isSelected ? .blue : .gray.opacity(0.6))
        }
        .padding(.horizontal, 4)
    }
}
