import SwiftUI

public struct GrowHeadline: View {
    
    private let text: String
    
    public init(
        _ text: String
    ) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .myFont(.headline1B)
            .myColor(.textNormal)
    }
}
