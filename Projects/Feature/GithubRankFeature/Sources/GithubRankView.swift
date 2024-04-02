import SwiftUI
import DesignSystem

public struct GithubRankView: View {
    
    @ObservedObject private var viewModel = GithubRankViewModel()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    VStack {
                        Text("아직 Github 설정이 완료되지 않았네요")
                            .foregroundStyle(.gray)
                            .font(.caption)
                        Text("Github Id를 설정하고 순위권에 도전해 보세요!")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        InfinityButton("설정하기", height: 40) {
                            // mv register view
                        }
                        .font(.callout)
                        .frame(width: 150)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 24)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                    .padding(.horizontal, 8)
                    ForEach(viewModel.rank, id: \.self) { i in
                        RankCell(rank: i + 1) {
                            print("tapped")
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 128)
            }
        }
    }
}
