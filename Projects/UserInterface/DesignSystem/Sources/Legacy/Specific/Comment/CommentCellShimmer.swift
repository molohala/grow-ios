////
////  CommentCell.swift
////  CommunityDetailFeature
////
////  Created by dgsw8th71 on 4/11/24.
////  Copyright © 2024 molohala. All rights reserved.
////
//
//import SwiftUI
//
//struct CommentCellShimmer: View {
//    var body: some View {
//        HStack(alignment: .top, spacing: 8) {
//            Circle()
//                .foregroundStyle(.gray)
//                .frame(width: 36, height: 36)
//            VStack(alignment: .leading, spacing: 0) {
//                profile
//                Text(Array(repeating: "-", count: .random(in: 2..<40)).joined())
//                    .font(.callout)
//            }
//        }
//    }
//    
//    @ViewBuilder
//    private var profile: some View {
//        HStack(spacing: 0) {
//            Text("---")
//                .font(.callout)
//                .fontWeight(.semibold)
//            Text("--")
//                .font(.caption)
//                .fontWeight(.regular)
//                .foregroundStyle(.gray)
//                .padding(.leading, 8)
//            Spacer()
//        }
//    }
//}
