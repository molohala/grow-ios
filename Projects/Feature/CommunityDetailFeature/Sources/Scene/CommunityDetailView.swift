import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem

public struct CommunityDetailView: View {
    
    @State private var text = ""
    @State private var reader: ScrollViewProxy?
    
    @StateObject private var viewModel: CommunityDetailViewModel
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
                    if viewModel.flow == .success {
                        VStack(alignment: .leading, spacing: 16) {
                            let text = "지존이dd"
                            profile
                            Text(text)
                                .font(.body)
                                .lineSpacing(.infinityLineSpacing)
                                .fontWeight(.medium)
                            info
                            Divider()
                            comments
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
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(spacing: 2) {
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text("1시간 전")
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
    private var info: some View {
        HStack {
            Button {
                //
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .foregroundStyle(Color.red400)
                    
                    Text("10")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var comments: some View {
        LazyVStack(spacing: 20) {
            ForEach(0..<10, id: \.self) { _ in
                CommentCell()
            }
        }
    }
}
