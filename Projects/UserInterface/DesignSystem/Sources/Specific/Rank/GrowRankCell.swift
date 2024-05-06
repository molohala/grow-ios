import SwiftUI

public struct GrowRankCell: View {
    
    private let name: String
    private let socialId: String
    private let rank: Int
    private let label: String
    private let action: () -> Void
    
    public init(
        name: String,
        socialId: String,
        rank: Int,
        label: String,
        action: @escaping () -> Void
    ) {
        self.name = name
        self.socialId = socialId
        self.rank = rank
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                HStack(spacing: 8) {
                    Text("\(rank)")
                        .growFont(.bodyR)
                        .growColor(.textNormal)
                    GrowAvatar(type: .large)
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 2) {
                            Text(name)
                                .growFont(.bodyM)
                                .growColor(.textNormal)
                            let medal: GrowImage? = switch rank {
                            case 1: .firstMedal
                            case 2: .secondMedal
                            case 3: .thirdMedal
                            default: nil
                            }
                            if let medal {
                                Image(image: medal)
                                    .resizable()
                                    .frame(size: 18)
                                    .clipShape(Circle())
                            }
                        }
                        Text(socialId)
                            .growFont(.bodyM)
                            .growColor(.textAlt)
                    }
                }
                Spacer()
                Text(label)
                    .growFont(.bodyB)
                    .growColor(.textNormal)
            }
            .padding(4)
        }
        .applyAnimation()
    }
}
