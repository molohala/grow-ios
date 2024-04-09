//
//  RankCell.swift
//  RankFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityGithubRankCell: View {
    
    let rank: Int
    let isCardView: Bool
    let action: () -> Void
    
    private init(
        rank: Int,
        isCardView: Bool,
        action: @escaping () -> Void
    ) {
        self.rank = rank
        self.isCardView = isCardView
        self.action = action
    }
    
    public init(
        rank: Int,
        action: @escaping () -> Void
    ) {
        self.init(
            rank: rank,
            isCardView: false,
            action: action
        )
    }
    
    public func cardView() -> Self {
        Self.init(
            rank: rank,
            isCardView: true,
            action: action
        )
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            if isCardView {
                label
                    .applyCardView()
            } else {
                label
            }
        }
        .applyAnimation()
    }
    
    @ViewBuilder
    private var label: some View {
        HStack(spacing: 12) {
            Text("\(rank)")
                .font(.body)
            ZStack {
                Rectangle()
                    .foregroundStyle(.gray)
                VStack {
                    Group {
                        switch rank {
                        case 1: DesignSystemAsset.firstMedal.swiftUIImage.resizable()
                        case 2: DesignSystemAsset.secondMedal.swiftUIImage.resizable()
                        case 3: DesignSystemAsset.thirdMedal.swiftUIImage.resizable()
                        default: EmptyView()
                        }
                    }
                    .frame(width: 28, height: 28)
                    Spacer()
                }
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("노영재")
                    .font(.body)
                Text("nohjason")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("10 커밋")
                .font(.body)
                .fontWeight(.semibold)
        }
        .background(.background)
        .frame(minHeight: 50)
    }
}
