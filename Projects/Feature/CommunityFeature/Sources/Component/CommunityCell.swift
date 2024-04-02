//
//  CommunityCell.swift
//  CommunityFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CommunityCell: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 48, height: 48)
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.regular)
                    .padding(.leading, 12)
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
