import SwiftUI

public struct GrowSettingCell<C>: View where C: View {
    
    
    public let label: String
    public let labelColor: GrowColorScheme
    public let leftIcon: GrowIconography?
    public let leftIconColor: GrowColorScheme
    public let description: String?
    public let content: () -> C
    public let action: (() -> Void)?
    
    public init(
        label: String,
        labelColor: GrowColorScheme = .textNormal,
        leftIcon: GrowIconography? = nil,
        leftIconColor: GrowColorScheme = .textAlt,
        content: @escaping () -> C = { EmptyView() },
        description: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.label = label
        self.labelColor = labelColor
        self.leftIcon = leftIcon
        self.leftIconColor = leftIconColor
        self.description = description
        self.content = content
        self.action = action
    }
    
    public var body: some View {
        
        HStack {
            HStack(spacing: 12) {
                if let leftIcon {
                    Image(icon: leftIcon)
                        .resizable()
                        .growIconColor(leftIconColor)
                        .frame(size: 24)
                }
                Text(label)
                    .growFont(.bodyB)
                    .growColor(labelColor)
            }
            Spacer()
            if let description {
                HStack(spacing: 8) {
                    Text(description)
                        .growFont(.labelM)
                        .growColor(.textAlt)
                    Image(icon: .expandRight)
                        .resizable()
                        .growIconColor(.textAlt)
                        .frame(size: 24)
                }
            }
            content()
        }
        .padding(.horizontal, 12)
        .frame(height: 60)
        .applyCardView()
        .if(action != nil) { view in
            Button {
                
            } label: {
                view
            }
            .applyAnimation()
        }
    }
}
