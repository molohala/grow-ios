//import SwiftUI
//import RankServiceInterface
//
//public struct GrowRankCell: View {
//    
//    private let rank: Rank
//    private let isMe: Bool
//    private let action: () async -> Void
//    
//    public init(
//        rank: Rank,
//        isMe: Bool,
//        action: @escaping () async -> Void
//    ) {
//        self.rank = rank
//        self.isMe = isMe
//        self.action = action
//    }
//    
//    public var body: some View {
//        Button {
//            Task {
//                await action()
//            }
//        } label: {
//            label
//        }
//        .applyAnimation()
//    }
//    
//    @ViewBuilder
//    private var label: some View {
//        HStack(spacing: 12) {
//            Text("\(rank.rank)")
//                .font(.body)
//            ZStack {
//                Rectangle()
//                    .foregroundStyle(.gray)
//                VStack {
//                    Group {
//                        switch rank.rank {
//                        case 1: DesignSystemAsset.firstMedal.swiftUIImage.resizable()
//                        case 2: DesignSystemAsset.secondMedal.swiftUIImage.resizable()
//                        case 3: DesignSystemAsset.thirdMedal.swiftUIImage.resizable()
//                        default: EmptyView()
//                        }
//                    }
//                    .frame(width: 28, height: 28)
//                    Spacer()
//                }
//            }
//            .frame(width: 48, height: 48)
//            .clipShape(Circle())
//            VStack(alignment: .leading) {
//                HStack {
//                    Text(rank.memberName)
//                        .font(.body)
//                    if isMe {
//                        Text("나")
//                            .font(.caption)
//                            .foregroundStyle(.white)
//                            .padding(.vertical, 1)
//                            .padding(.horizontal, 3)
//                            .background(Color.gray)
//                            .clipShape(RoundedRectangle(cornerRadius: 3))
//                            .fontWeight(.bold)
//                    }
//                }
//                Text(rank.socialId)
//                    .font(.callout)
//                    .foregroundStyle(.gray)
//            }
//            Spacer()
//            Text("\(rank.count) 문제")
//                .font(.body)
//                .fontWeight(.semibold)
//        }
//        .background(.background)
//        .frame(minHeight: 50)
//    }
//}
