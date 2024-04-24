//
//  InfinityStatCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityStatShimmerCell: View {
    
    public init() {}
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("int")
                    .font(.largeTitle)
                Spacer()
            }
            Text("title")
                .font(.callout)
        }
        .padding(4)
        .applyCardView()
        .shimmer()
    }
}
