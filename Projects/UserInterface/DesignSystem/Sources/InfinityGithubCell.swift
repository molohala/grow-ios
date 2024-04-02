//
//  InfinityGithubCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityGithubCell: View {
    
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
                    DesignSystemAsset.github.swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color(0x24292e))
                    Text("nohjason")
                        .font(.body)
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.gray)
                        .font(.body)
                }
                Text("대충 여기 그래프")
                    .padding(.vertical, 40)
            }
            .applyCardView()
        }
        .applyAnimation()
    }
}
