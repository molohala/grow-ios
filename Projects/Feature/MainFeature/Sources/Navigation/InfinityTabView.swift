//
//  InfinityTabView.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityTabView: View {
    @Binding var selectedTab: MainViewType
    
    public init(selectedTab: Binding<MainViewType>) {
        self._selectedTab = selectedTab
    }
    
    public var body: some View {
        HStack {
            let mainViews = MainViewType.allCases
            ForEach(mainViews, id: \.self) { tab in
                Spacer()
                Button {
                    selectedTab = tab
                } label: {
                    InfinityTabCell(type: tab, isSelected: selectedTab == tab)
                }
                .applyAnimation()
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.white)
//        .cornerRadius(12, corners: .allCorners)
        .onChange(of: selectedTab) { _ in
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }
//        .shadow(.bottomNavigation(.default))
    }
}
