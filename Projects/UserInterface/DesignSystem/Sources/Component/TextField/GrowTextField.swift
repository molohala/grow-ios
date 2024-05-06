import SwiftUI

public struct GrowTextField: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    @Binding var text: String
    @State private var isHide = true
    
    // MARK: - parameters
    private let hint: String
    private let isSecured: Bool
    private let isEnabled: Bool
    private let isRounded: Bool
    
    public init(
        _ hint: String = "",
        text: Binding<String>,
        isSecured: Bool = false,
        isEnabled: Bool = true,
        isRounded: Bool = false
    ) {
        self.hint = hint
        self._text = text
        self.isSecured = isSecured
        self.isEnabled = isEnabled
        self.isRounded = isRounded
    }
    
    // MARK: - View
    public var body: some View {
        Group {
            if isSecured && isHide {
                SecureField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foregroundColor(colorProvider.color(.textAlt))
                )
            } else {
                TextField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foregroundColor(colorProvider.color(.textAlt))
                )
                .growColor(text.isEmpty ? .textAlt : .textNormal)
            }
        }
        .textFieldStyle(
            GrowTextFieldStyle(
                text: $text,
                isSecured: isSecured,
                isHide: $isHide,
                isEnabled: isEnabled,
                isRounded: isRounded
            )
        )
        .disabled(!isEnabled)
    }
}

struct GrowTextFieldStyle: TextFieldStyle {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    @FocusState private var isFocused: Bool
    @Binding private var text: String
    @Binding private var isHide: Bool
    
    // MARK: - Parameters
    private let isSecured: Bool
    private let isEnabled: Bool
    private let isRounded: Bool
    
    init(
        text: Binding<String>,
        isSecured: Bool,
        isHide: Binding<Bool>,
        isEnabled: Bool,
        isRounded: Bool
    ) {
        self._text = text
        self.isSecured = isSecured
        self._isHide = isHide
        self.isEnabled = isEnabled
        self.isRounded = isRounded
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        let strokeColor: GrowColorScheme = !isEnabled ? .textFieldSecondaryDisabled : isFocused ? .textFieldPrimary : .textFieldSecondary
        let textColor: GrowColorScheme = !isEnabled ? .textFieldTextDisabled : .textNormal
        let iconColor: GrowColorScheme = !isEnabled ? .textFieldTextDisabled : .textAlt
        let radius: CGFloat = isRounded ? 26 : 12
        print(colorProvider.isDarkTheme)
        print(colorProvider.color(strokeColor))
        return configuration
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .textContentType(.init(rawValue: ""))
            .focused($isFocused)
            .growFont(.bodyM)
            .frame(height: 52)
            .cornerRadius(radius, corners: .allCorners)
            .padding(.horizontal, 12) // for inner padding
            .accentColor(colorProvider.color(.textFieldPrimary)) // for indicator color
            .growColor(textColor) // for text color
            .stroke(radius, content: colorProvider.color(strokeColor), lineWidth: 1.5) // for stroke color
            .overlay(
                HStack(spacing: 0) {
                    Spacer()
                    Group {
                        if isEnabled {
                            if isSecured {
                                Image(icon: isHide ? .hide : .show)
                                    .resizable()
                                    .growIconColor(iconColor)
                                    .onTapGesture {
                                        isHide.toggle()
                                    }
                            } else if !text.isEmpty {
                                Image(icon: .closeFill)
                                    .resizable()
                                    .growIconColor(iconColor)
                                    .onTapGesture {
                                        text = ""
                                    }
                            }
                        }
                    }
                    .frame(size: 28)
                }
                .padding(.trailing, 8)
            )
            .onTapGesture {
                isFocused = true
            }
    }
}
