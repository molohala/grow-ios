import SwiftUI

public struct GrowStatCell: View {
    
    private let title: String
    private let type: GrowStatType
    private let action: () -> Void
    
    public init(
        _ title: String,
        type: GrowStatType,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    if case .baekjoon(let int) = type {
                        if let int {
                            Text("\(int)")
                                .font(.largeTitle)
                                .fixedSize()
                        } else {
                            Text("??")
                                .font(.largeTitle)
                                .fixedSize()
                        }
                    } else if case .github(let int) = type {
                        if let int {
                            Text("\(int)")
                                .font(.largeTitle)
                                .fixedSize()
                        } else {
                            Text("??")
                                .font(.largeTitle)
                                .fixedSize()
                        }
                    }
                    Spacer()
                    type.icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(type.iconColor)
                        .frame(width: 32, height: 32)
                }
                Text(title)
                    .font(.callout)
            }
            .padding(4)
            .applyCardView()
        }
        .applyAnimation()
    }
}
