//
//  InfinityTabCell.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import BaseFeature
import DesignSystem

struct InfinityTabCell: View {
    
    let type: MainFlow
    let isSelected: Bool
    
    init(type: MainFlow, isSelected: Bool) {
        self.type = type
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                type.image
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(.top, 4)
                    .foregroundStyle(isSelected ? Color.blue500 : .gray.opacity(0.6))
                Text(type.name)
                    .font(.caption2)
                    .foregroundStyle(isSelected ? Color.blue500 : .gray.opacity(0.6))
            }
            .padding(.horizontal, 4)
            Spacer()
        }
    }
}
