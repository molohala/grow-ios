import SwiftUI

public struct InfinityButton: View {
    
    // MARK: - State
    @State private var isLoading: Bool
    
    // MARK: - Parameters
    var text: String
    var asyncAction: () async -> Void
    var height: CGFloat
    
    public init(_ text: String,
                isLoading: Bool = false,
                height: CGFloat = 58,
                asyncAction: @escaping () async -> Void) {
        self.text = text
        self.isLoading = isLoading
        self.asyncAction = asyncAction
        self.height = height
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
        .buttonStyle(SeugiButtonStyle(height: height, isLoading: isLoading))
    }
}
struct SeugiButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    var height: CGFloat
    var isLoading: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(isEnabled ? Color.blue500 : Color.blue500.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .addPressAnimation(configuration.isPressed)
    }
}
