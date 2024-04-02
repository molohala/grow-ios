import SwiftUI

public struct InfinityButton: View {
    
    var text: String
    var isLoading: Bool
    var callback: () -> Void
    
    public init(_ text: String,
                isLoading: Bool = false,
                callback: @escaping () -> Void) {
        self.text = text
        self.isLoading = isLoading
        self.callback = callback
    }
    
    public var body: some View {
        Button {
            callback()
        } label: {
            Text(!isLoading ? text : "")
                .overlay {
                    if isLoading {
                        ProgressView()
                    }
                }
        }
        .disabled(isLoading)
        .buttonStyle(SeugiButtonStyle(isLoading: isLoading))
    }
}
struct SeugiButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    var isLoading: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .frame(height: 58)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .addPressAnimation(configuration.isPressed)
    }
}
