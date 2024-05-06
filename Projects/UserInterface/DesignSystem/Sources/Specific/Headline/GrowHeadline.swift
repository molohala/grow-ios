import SwiftUI

public struct GrowHeadline: View {
    
    private let text: String
    
    public init(
        text: String
    ) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .growFont(.headline1B)
            .growColor(.textNormal)
    }
}
