import SwiftUI
import SwiftUtil
import MyDesignSystem

public struct GrowMotivationCell: View {
    public init() {}
    
    public var body: some View {
        if let motivation = motivations.randomElement() {
            Text(motivation)
                .myColor(.textNormal)
                .myFont(.headline2R)
                .multilineTextAlignment(.center)
                .toCenter()
                .padding(16)
        }
    }
}
