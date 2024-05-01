//
//  InfinityGithubCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import InfoServiceInterface
import DateUtil

public enum ChartType: String, CaseIterable {
    case github = "Github"
    case baekjoon = "백준"
}

public struct ChartInfo {
    let title: String
    let subtitle: String
    let subject: String
    let chartData: InfinityChartData
    
    public init(title: String, subtitle: String, subject: String, chartData: InfinityChartData) {
        self.title = title
        self.subtitle = subtitle
        self.subject = subject
        self.chartData = chartData
    }
}

public struct InfinityChartCell: View {
    
    private let chartInfo: ChartInfo
    @Binding var selectedType: ChartType
    
    public init(
        chartInfo: ChartInfo,
        selectedType: Binding<ChartType>
    ) {
        self.chartInfo = chartInfo
        self._selectedType = selectedType
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(chartInfo.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Text(chartInfo.title)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                Spacer()
                    .foregroundStyle(.gray)
                Picker(selection: $selectedType) {
                    ForEach(ChartType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text(chartInfo.subject)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .tint(.gray)
                        Icon.downArrorIcon
                    }
                }
                .applyAnimation()
                .padding(8)
            }
            InfinityChart(chartData: chartInfo.chartData)
                .frame(height: 200)
        }
        .applyCardView()
    }
}

public extension [Commit] {
    var githubWeekChartInfo: ChartInfo {
        .init(
            title: "\(self.map { $0.contributionCount }.reduce(0, +))",
            subtitle: "이번주에 한 커밋",
            subject: ChartType.github.rawValue,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", y: $0.contributionCount) },
                color: .orange500
            )
        )
    }
}

public extension [Solve] {
    var baekjoonWeekChartInfo: ChartInfo {
        .init(
            title: "\(self.map { $0.solvedCount }.reduce(0, +))",
            subtitle: "이번주에 푼 문제",
            subject: ChartType.github.rawValue,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", y: $0.solvedCount) },
                color: .orange500
            )
        )
    }
}

