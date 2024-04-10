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
        VStack(alignment: .leading, spacing: 16) {
            profile
            Text("지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존")
                .lineSpacing(.infinityLineSpacing)
                .font(.callout)
                .fontWeight(.medium)
            info
        }
        .applyCardView()
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(spacing: 2) {
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text("1시간 전")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.leading, 4)
            }
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
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 0) {
            Button {
                //
            } label: {
                Image(systemName: "heart.fill")
                    .font(.body)
                    .foregroundStyle(Color.red400)
            }
            Text("10")
                .font(.footnote)
                .foregroundStyle(.gray)
            Button {
                //
            } label: {
                Image(systemName: "message.fill")
                    .font(.body)
                    .foregroundStyle(Color.gray500)
            }
            .padding(.leading, 8)
            Text("32")
                .font(.footnote)
                .foregroundStyle(.gray)
            Spacer()
        }
    }
}
