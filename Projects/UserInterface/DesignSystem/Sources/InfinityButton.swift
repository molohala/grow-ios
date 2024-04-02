import SwiftUI

public struct InfinityButton: View {
    
    // MARK: - State
    @State private var isLoading: Bool
    
    // MARK: - Parameters
    var text: String
    var asyncAction: () async -> Void
    
    public init(_ text: String,
                isLoading: Bool = false,
                asyncAction: @escaping () async -> Void) {
        self.text = text
        self.isLoading = isLoading
        self.asyncAction = asyncAction
    }
    
    public var body: some View {
        Button {
            isLoading = true
            Task {
                await asyncAction()
                isLoading = false
            }
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
            .foregroundStyle(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .addPressAnimation(configuration.isPressed)
    }
}
