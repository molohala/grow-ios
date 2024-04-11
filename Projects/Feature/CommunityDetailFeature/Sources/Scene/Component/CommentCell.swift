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
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 0) {
                profile
                Text("이야 짱이다")
                    .font(.callout)
            }
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Text("노영재")
                .font(.callout)
                .fontWeight(.semibold)
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
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}
