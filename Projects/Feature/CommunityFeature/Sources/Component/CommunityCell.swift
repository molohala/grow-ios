//
//  CommunityCell.swift
//  CommunityFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

struct CommunityCell: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 48, height: 48)
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.regular)
                Spacer()
            }
            Text("지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존")
                .font(.body)
                .fontWeight(.medium)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
