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
    private let proxy: GeometryProxy
    
    public init(
        selectedTab: Binding<MainViewType>,
        proxy: GeometryProxy
    ) {
        self._selectedTab = selectedTab
        self.proxy = proxy
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            let mainViews = MainViewType.allCases
            ForEach(mainViews, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    InfinityTabCell(type: tab, isSelected: selectedTab == tab)
                        .frame(width: proxy.size.width / 5)
                }
                .applyAnimation()
            }
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
