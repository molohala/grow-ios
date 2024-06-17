import SwiftUI
import MyDesignSystem

public struct GrowSettingCell<C>: View where C: View {
    
    public let label: String
    public let labelColor: MyColorScheme
    public let leftIcon: MyIconography?
    public let leftIconColor: MyColorScheme
    public let description: String?
    public let content: () -> C
    public let action: (() -> Void)?
    
    public init(
        label: String,
        labelColor: MyColorScheme = .textNormal,
        leftIcon: MyIconography? = nil,
        leftIconColor: MyColorScheme = .textAlt,
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
                        .myIconColor(leftIconColor)
                        .frame(size: 24)
                }
                Text(label)
                    .myFont(.bodyB)
                    .myColor(labelColor)
            }
            Spacer()
            if let description {
                HStack(spacing: 8) {
                    Text(description)
                        .myFont(.labelM)
                        .myColor(.textAlt)
                    Image(icon: .expandRight)
                        .resizable()
                        .myIconColor(.textAlt)
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
                if let action {
                    action()
                }
            } label: {
                view
            }
            .applyAnimation()
        }
    }
}
