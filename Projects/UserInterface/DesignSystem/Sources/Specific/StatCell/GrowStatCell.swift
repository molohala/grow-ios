import SwiftUI

public struct GrowStatCell: View {
    
    private let label: String
    private let type: StatCellType
    private let action: () -> Void
    
    public init(
        label: String,
        type: StatCellType,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.type = type
        self.action = action
    }
    
    public var body: some View {
        
        let number = switch type {
        case .github(let commit):
            commit
        case .baekjoon(let solved):
            solved
        }
        
        Button {
            action()
        } label: {
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
        }
        .applyAnimation()
    }
}
