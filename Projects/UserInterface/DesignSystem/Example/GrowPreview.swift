import SwiftUI
import DesignSystem

enum GrowPreview: String, CaseIterable {
    case TopAppBar
    
    var view: some View {
        Group {
            switch self {
            case .TopAppBar: TopAppBarPreview()
            }
        }
    }
    static var preview: some View {
        NavigationStack {
//            List(Self.allCases, id: \.self) { preview in
//                NavigationLink {
//                    preview.view
//                } label: {
//                    Text("\(preview.rawValue) Preview")
//                }
//            }
            GrowPreview.TopAppBar.view
        }
    }
}
