//
//  RankCell.swift
//  RankFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import DesignSystem

struct RankCell: View {
    
    var rank: Int
    var tapped: () -> Void
    
    var body: some View {
        Button {
            tapped()
        } label: {
            HStack(spacing: 12) {
                Text("\(rank)")
                    .font(.caption)
                Rectangle()
                    .frame(width: 50, height: 50)
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
            }
            .background(.background)
            .frame(minHeight: 50)
        }
        .applyAnimation()
    }
}
