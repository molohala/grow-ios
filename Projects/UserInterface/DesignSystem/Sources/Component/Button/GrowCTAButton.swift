import SwiftUI

public struct GrowCTAButton: View {
    
    // MARK: - State
    @State private var isLoading: Bool = false
    
    // MARK: - Parameters
    private let text: String
    private let leadingIcon: GrowIconography?
    private let trailingIcon: GrowIconography?
    private let isEnabled: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        leadingIcon: GrowIconography? = nil,
        trailingIcon: GrowIconography? = nil,
        isEnabled: Bool = true,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isEnabled = isEnabled
        self.action = action
    }
    
    public var body: some View {
        
        let color: GrowColorScheme = isEnabled ? .buttonText : .buttonTextDisabled
        
        Button {
            guard isEnabled, !isLoading else { return }
            isLoading = true
            Task {
                await action()
                isLoading = false
            }
        } label: {
            HStack(spacing: 6) {
                if let leadingIcon {
                    Image(icon: leadingIcon)
                        .resizable()
                        .growIconColor(color)
                        .frame(size: 20)
                }
                if isLoading {
                    ProgressView()
                } else {
                    Text(text)
                        .growColor(color)
                        .growFont(.bodyB)
                        .overlay {
                            if isLoading {
                                ProgressView()
                            }
                        }
                }
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
                        .growIconColor(color)
                        .frame(size: 20)
                }
            }
        }
        .buttonStyle(GrowButtonStyle(isLoading: isLoading, isEnabled: isEnabled))   
        .disabled(isLoading)
    }
}

struct GrowButtonStyle: ButtonStyle {
    private let isLoading: Bool
    private let isEnabled: Bool
    
    init(
        isLoading: Bool,
        isEnabled: Bool
    ) {
        self.isLoading = isLoading
        self.isEnabled = isEnabled
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        let background: GrowColorScheme = isEnabled ? .buttonPrimary : .buttonPrimaryDisabled
        
        configuration.label
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .growBackground(background)
            .cornerRadius(12, corners: .allCorners)
            .if(isEnabled) {
                $0.addPressAnimation(configuration.isPressed)
            }
    }
}
