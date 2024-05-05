import SwiftUI

public struct GrowTextField: View {
    
    var hint: String
    @Binding var text: String
    var isSecured: Bool
    
    @FocusState private var isFocused: Bool
    
    public init(_ hint: String, text: Binding<String>, isSecured: Bool = false) {
        self.hint = hint
        self._text = text
        self.isSecured = isSecured
    }
    
    public var body: some View {
        
        Group {
            if isSecured {
                SecureField(hint, text: $text)
                    .focused($isFocused)
            } else {
                TextField(hint, text: $text)
                    .focused($isFocused)
            }
        }
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .padding(15)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1.0)
                .foregroundStyle(.gray.opacity(0.3))
        }
        .onTapGesture {
            isFocused = true
        }
    }
}
