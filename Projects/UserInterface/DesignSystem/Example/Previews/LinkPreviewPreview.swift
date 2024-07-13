import SwiftUI
import SwiftUtil
import DesignSystem

struct LinkPreviewPreview: View {
    
    let str = """
우와 지존입니다 ㅋ 응
https://www.youtube.com/watch?v=DXUL2iYIZsY&t=15s
"""
    
    var links: [String] {
        str.links
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let link = links.first {
                    GrowLinkPreview(url: URL(string: link)!)
                        .padding(12)
                }
            }
        }
        .onAppear {
            print(links)
        }
    }
}
