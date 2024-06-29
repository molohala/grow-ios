import SwiftUI

public struct BlockedUserCell: View {
    
    public let name: String
    public let action: () -> Void
    
    public init(
        name: String,
        action: @escaping () -> Void
    ) {
        self.name = name
        self.action = action
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Text(name)
                .myFont(.bodyB)
                .myColor(.textNormal)
            Spacer()
            Button {
                action()
            } label: {
                Text("차단 해제")
                    .myFont(.labelM)
                    .myColor(.textAlt)
            }
            .applyAnimation()
        }
        .padding(.horizontal, 12)
        .frame(height: 60)
        .applyCardView()
    }
}
