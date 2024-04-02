//
//  InfinityTabCell.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

struct InfinityTabCell: View {
    
    let type: MainViewType
    let isSelected: Bool
    
    init(type: MainViewType, isSelected: Bool) {
        self.type = type
        self.isSelected = isSelected
    }
    
    var body: some View {
        
        VStack {
            type.image
                .renderingMode(.template)
                .resizable()
                .frame(width: 28, height: 28)
                .padding(.top, 4)
                .foregroundStyle(.blue)
            Text(type.name)
                .font(.caption)
                .foregroundStyle(.black)
        }
        .padding(.horizontal, 4)
    }
}
