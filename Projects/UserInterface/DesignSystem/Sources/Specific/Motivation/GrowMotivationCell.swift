import SwiftUI

public struct GrowMotivationCell: View {
    public init() {}
    
    public var body: some View {
        if let motivation = motivations.randomElement() {
            Text(motivation)
                .growColor(.textNormal)
                .multilineTextAlignment(.center)
                .toCenter()
                .padding(16)
        }
    }
}
