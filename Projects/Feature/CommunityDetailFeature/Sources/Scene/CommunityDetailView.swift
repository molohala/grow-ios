import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem
import CommunityServiceInterface

public struct CommunityDetailView: View {
    
    @State private var text = ""
    @State private var reader: ScrollViewProxy?
    
    @StateObject private var viewModel: CommunityDetailViewModel
    @Environment(\.dismiss) private var dismiss
    private let id: Int
    
    public init(
        viewModel: CommunityDetailViewModel,
        id: Int
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.id = id
    }
    
    public var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView {
                    if viewModel.flow == .success, let community = viewModel.community {
                        VStack(alignment: .leading, spacing: 16) {
                            profile(community)
                            Text(community.content)
                                .font(.body)
                                .lineSpacing(.infinityLineSpacing)
                                .fontWeight(.medium)
                            info(community)
                            Divider()
                            comments(community)
                                .padding(.bottom, 64)
                        }
                        .padding(.horizontal, 16)
                        .onAppear {
                            self.reader = reader
                        }
                    } else {
                        ShimmerCommunityDetailCell()
                            .shimmer()
                    }
                }
            }
            VStack(spacing: 0) {
                Spacer()
                Divider()
                HStack {
                    TextField("댓글을 남겨보세요", text: $text)
                        .padding(8)
                        .font(.body)
                    Button {
                        //
                        if let reader {
                            withAnimation {
                                reader.scrollTo(9, anchor: .top)
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .renderingMode(.template)
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                }
                .padding(.horizontal, 8)
                .padding(8)
                .background(Color.white)
            }
        }
        .background(Color.white)
        .hideKeyboardWhenTap()
        .infinityTopBar("")
        .task {
            await viewModel.fetchCommunity(id: id)
        }
        .alert(
            "게시글을 불러올 수 없습니다",
            isPresented: .init(
                get: { viewModel.flow == .failure },
                set: { _ in dismiss() }
            )
        ) {
            Button("확인", role: .cancel) {
                dismiss()
            }
        }
    }
    
    @ViewBuilder
    func profile(_ c: Community) -> some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(spacing: 2) {
                Text(c.writerName)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text(c.createdAt.timeAgo)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.leading, 4)
            }
            Spacer()
            Button {
                //
            } label: {
                DesignSystemAsset.detailVerticalLine.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.gray)
            }
        }
    }
    
    @ViewBuilder
    private func info(_ c: Community) -> some View {
        HStack {
            Button {
                //
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .foregroundStyle(Color.red400)
                    
                    Text("\(c.like)")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func comments(_ c: Community) -> some View {
        LazyVStack(spacing: 20) {
            ForEach(0..<10, id: \.self) { _ in
                CommentCell()
            }
        }
    }
}
