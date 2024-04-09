//
//  InfinityStatCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityStatCell: View {
    
    private let type: InfinityStatType
    private let action: () -> Void
    
    public init(
        type: InfinityStatType,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    if case .baekjoon(let int) = type {
                        Text("\(int)")
                            .font(.largeTitle)
                    } else if case .github(let int) = type {
                        Text("\(int)")
                            .font(.largeTitle)
                    }
                    Spacer()
                    type.icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(type.iconColor)
                        .frame(width: 32, height: 32)
                }
                Text(type.title)
                    .font(.callout)
            }
            .applyCardView()
        }
        .applyAnimation()
    }
}
