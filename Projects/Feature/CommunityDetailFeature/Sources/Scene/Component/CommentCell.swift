//
//  CommentCell.swift
//  CommunityDetailFeature
//
//  Created by dgsw8th71 on 4/11/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import DesignSystem
import CommentServiceInterface

struct CommentCell: View {
    
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 0) {
                profile
                TextWrapper(comment.content, font: .callout)
            }
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Text(comment.name)
                .font(.callout)
                .fontWeight(.semibold)
            Text(comment.createdAt.timeAgo)
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
