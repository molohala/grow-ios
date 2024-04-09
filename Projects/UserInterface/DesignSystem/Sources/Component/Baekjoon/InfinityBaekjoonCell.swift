//
//  InfinityBaekjoonCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityBaekjoonCell: View {
    
    var tapped: () -> Void
    
    public init(
        tapped: @escaping () -> Void
    ) {
        self.tapped = tapped
    }
    
    public var body: some View {
        Button {
            tapped()
        } label: {
            VStack {
                HStack {
                    DesignSystemAsset.baekjoon.swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 28)
                        .foregroundStyle(Color.baekjoon)
                    Text("nohjason")
                        .font(.body)
                        .foregroundStyle(.black)
                    Spacer()
                    Icon.rightArrorIcon
                }
                InfinityChart()
                    .frame(height: 200)
            }
            .applyCardView()
        }
        .applyAnimation()
    }
}
