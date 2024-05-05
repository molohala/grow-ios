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
    private let removeAction: () -> Void
    
    init(
        comment: Comment,
        removeAction: @escaping () -> Void
    ) {
        self.comment = comment
        self.removeAction = removeAction
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 0) {
                profile
                Text(LocalizedStringKey(comment.content))
                    .font(.callout)
                    .applyOpenURL()
            }
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Text(comment.name)
                .growFont(.callout)
                .fontWeight(.semibold)
            Text(comment.createdAt.timeAgo)
                .growFont(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.leading, 8)
            Spacer()
            Menu {
                Button("삭제하기", role: .destructive) {
                    removeAction()
                }
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
