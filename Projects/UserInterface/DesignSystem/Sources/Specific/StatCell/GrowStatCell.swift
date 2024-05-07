import SwiftUI

public struct GrowStatCell: View {
    
    private let label: String
    private let type: StatCellType
    private let action: () -> Void
    private let socialId: String?
    
    public init(
        label: String,
        type: StatCellType,
        socialId: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.type = type
        self.socialId = socialId
        self.action = action
    }
    
    public var body: some View {
        
        let number = switch type {
        case .github(let commit):
            commit
        case .baekjoon(let solved):
            solved
        }
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                if let number {
                    Text("\(number)")
                        .growFont(.title1B)
                        .growColor(.textNormal)
                } else {
                    Text("??")
                        .growFont(.title1B)
                        .growColor(.textNormal)
                }
                Spacer()
                Image(icon: type.icon)
                    .resizable()
                    .growIconColor(type.color)
                    .frame(size: 32)
            }
            Text(label)
                .growFont(.labelM)
                .growColor(.textDarken)
        }
        .padding(16)
        .applyCardView()
        .if(socialId != nil) { view in
            Group {
                if let socialId {
                    let urlText = switch type {
                    case .github:
                        "http://github.com/\(socialId)"
                    case .baekjoon:
                        "https://acmicpc.net/user/\(socialId)"
                    }
                    Link(destination: URL(string: urlText)!) {
                        view
                    }
                } else {
                    view
                }
            }
        }
    }
}
