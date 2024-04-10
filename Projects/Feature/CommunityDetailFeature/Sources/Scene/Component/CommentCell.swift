//
//  CommentCell.swift
//  CommunityDetailFeature
//
//  Created by dgsw8th71 on 4/11/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CommentCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            profile
            Text("이야 짱이다")
                .font(.callout)
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            Text("노영재")
                .font(.callout)
                .fontWeight(.semibold)
                .padding(.leading, 8)
            Text("1시간 전")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.leading, 8)
            Spacer()
            Button {
                //
            } label: {
                DesignSystemAsset.detailVerticalLine.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}
