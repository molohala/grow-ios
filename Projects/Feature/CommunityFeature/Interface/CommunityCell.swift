import SwiftUI
import CommunityServiceInterface
import DesignSystem

public struct CommunityCell: View {
    
    private let community: Community
    private let likeAction: () -> Void
    private let editAction: () -> Void
    private let removeAction: () -> Void
    private let action: () -> Void
    
    public init(
        community: Community,
        likeAction: @escaping () -> Void,
        editAction: @escaping () -> Void,
        removeAction: @escaping () -> Void,
        action: @escaping () -> Void
    ) {
        self.community = community
        self.likeAction = likeAction
        self.editAction = editAction
        self.removeAction = removeAction
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                label
            }
            .applyAnimation()
            HStack {
                Spacer()
                VStack {
                    Menu {
                        Button("수정하기", action: editAction)
                        Button("삭제하기", role: .destructive, action: removeAction)
                    } label: {
                        DesignSystemAsset.detailVerticalLine.swiftUIImage
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.gray)
                    }
                    .padding(12)
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    private var label: some View {
        VStack(alignment: .leading, spacing: 16) {
            profile
            TextWrapper(community.content, font: .callout)
            info
        }
        .applyCardView()
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 2) {
                Text(community.writerName)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text(community.createdAt.timeAgo)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 8)
            Spacer()
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 4) {
            Button {
                likeAction()
            } label: {
                Image(systemName: "heart")
                    .font(.body)
                    .foregroundStyle(community.liked ? Color.red400 : Color.gray500)
                Text("\(community.like)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .layoutPriority(2)
            Spacer()
        }
    }
}
