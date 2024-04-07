import SwiftUI
import DesignSystem

public struct GithubRankView: View {
    
    @ObservedObject private var viewModel = GithubRankViewModel()
    
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
//                            navigateToProfileEdit()
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
                    HStack {
                        InfinitySelector(text: "이번 주", isSelected: true) {
                            //
                        }
                        InfinitySelector(text: "전체", isSelected: false) {
                            //
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    ForEach(viewModel.rank, id: \.self) { i in
                        InfinityGithubRankCell(rank: i + 1) {
//                            navigateToProfileDetail()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
        }
    }
}
