import SwiftUI

public struct TextWrapper: UIViewRepresentable {
    var text: String
    var font: InfinityFont
    var lineSpacing: CGFloat
    
    public init(_ text: String, font: InfinityFont, lineSpacing: CGFloat = 4) {
        self.text = text
        self.font = font
        self.lineSpacing = lineSpacing
    }
    
    public func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        textView.backgroundColor = .clear
        textView.font = font.uiFont
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        textView.textContainerInset = .zero
        return textView
    }
    
    public func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
        textView.sizeToFit()
        textView.layoutIfNeeded()
    }
}
