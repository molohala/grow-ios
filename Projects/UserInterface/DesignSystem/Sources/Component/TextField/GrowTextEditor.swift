import SwiftUI

public struct GrowTextEditor: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    // MARK: - parameters
    private let isEnabled: Bool
    private let isRounded: Bool
    
    public init(
        text: Binding<String>,
        isEnabled: Bool = true,
        isRounded: Bool = false
    ) {
        self._text = text
        self.isEnabled = isEnabled
        self.isRounded = isRounded
    }
    
    // MARK: - View
    public var body: some View {
        let strokeColor: GrowColorScheme = !isEnabled ? .textFieldSecondaryDisabled : isFocused ? .textFieldPrimary : .textFieldSecondary
        let textColor: GrowColorScheme = !isEnabled ? text.isEmpty ? .textAlt : .textFieldTextDisabled : .textNormal
        let iconColor: GrowColorScheme = !isEnabled ? .textFieldTextDisabled : .textAlt
        let radius: CGFloat = isRounded ? 26 : 12
        TextEditor(
            text: $text
        )
        .disabled(!isEnabled)
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .textContentType(.init(rawValue: ""))
        .textEditorBackground(.clear)
        .focused($isFocused)
        .growFont(.bodyM)
        .cornerRadius(radius, corners: .allCorners)
        .padding(.vertical, 8)
        .padding(.horizontal, 12) // for inner padding
        .accentColor(colorProvider.color(.textFieldPrimary)) // for indicator color
        .growColor(textColor) // for text color
        .stroke(radius, content: colorProvider.color(strokeColor), lineWidth: 1.5) // for stroke color
        .onTapGesture {
            isFocused = true
        }
        .padding(.vertical, 0.5)
    }
}
