//
//  InfinityStatCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityStatCell: View {
    
    private let title: String
    private let type: InfinityStatType
    private let action: () -> Void
    
    public init(
        _ title: String,
        type: InfinityStatType,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    if case .baekjoon(let int) = type {
                        Text("\(int)")
                            .font(.largeTitle)
                            .fixedSize()
                    } else if case .github(let int) = type {
                        Text("\(int)")
                            .font(.largeTitle)
                            .fixedSize()
                    }
                    Spacer()
                    type.icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(type.iconColor)
                        .frame(width: 32, height: 32)
                }
                Text(title)
                    .font(.callout)
            }
            .padding(4)
            .applyCardView()
        }
        .applyAnimation()
    }
}
