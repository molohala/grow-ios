//import SwiftUI
//
//public struct GrowTextEditor: View {
//    
//    var hint: String
//    @Binding var text: String
//    var isSecured: Bool
//    
//    @FocusState private var isFocused: Bool
//    
//    public init(
//        _ hint: String,
//        text: Binding<String>,
//        isSecured: Bool = false
//    ) {
//        self.hint = hint
//        self._text = text
//        self.isSecured = isSecured
//    }
//    
//    public var body: some View {
//        ZStack {
//            TextEditor(text: $text)
//                .padding(8)
//                .focused($isFocused)
//                .autocapitalization(.none)
//                .disableAutocorrection(true)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(lineWidth: 1.0)
//                        .foregroundStyle(.gray.opacity(0.3))
//                }
//                .onTapGesture {
//                    isFocused = true
//                }
//        
//            if text.isEmpty {
//                VStack {
//                    HStack {
//                        Text(hint)
//                            .foregroundColor(Color.gray.opacity(0.6))
//                            .padding(15)
//                        Spacer()
//                    }
//                    Spacer()
//                }
//            }
//        }
//    }
//}
