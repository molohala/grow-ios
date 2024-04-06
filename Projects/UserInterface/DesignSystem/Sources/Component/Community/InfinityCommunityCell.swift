//
//  InfinityCommunityCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityCommunityCell: View {
    
    private let action: () -> Void
    
    public init(
        action: @escaping () -> Void
    ) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            label
        }
        .applyAnimation()
    }
    
    @ViewBuilder
    private var label: some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 48, height: 48)
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text("1시간 전")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.leading, 4)
                Spacer()
            }
            Text("지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존")
                .font(.body)
                .fontWeight(.medium)
        }
        .applyCardView()
    }
}
