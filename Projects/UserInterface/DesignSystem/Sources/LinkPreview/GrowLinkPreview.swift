import SwiftUI
import NukeUI
import MyDesignSystem
import OpenGraph

public struct GrowLinkPreview: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    @Binding private var openGraph: OpenGraph?
    @State private var imageSize: CGSize = .zero
    
    private let url: URL
    
    public init(
        url: URL,
        openGraph: Binding<OpenGraph?>
    ) {
        self.url = url
        self._openGraph = openGraph
    }
    
    public var body: some View {
        Button {
            UIApplication.shared.open(url)
        } label: {
            if let openGraph, !openGraph.source.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    if let image = openGraph[.image] ?? openGraph[.imageUrl],
                       let imageUrl = URL(string: image) {
                        LazyImage(url: imageUrl) { state in
                            if let image = state.image {
                                makeImage(image)
                            } else if state.error != nil {
                                emptyImage
                            } else {
                                GeometryReader { geo in
                                    RowShimmer(width: geo.size.width, height: geo.size.width * 9 / 16) // 16:9
                                        .onAppear {
                                            imageSize = geo.size
                                        }
                                }
                                .frame(height: imageSize.width * 9 / 16)
                            }
                        }
                    } else {
                        emptyImage
                    }
                    makeInfo(openGraph: openGraph)
                }
                .myBackground(.backgroundAlt)
                .stroke(8, content: colorProvider.color(.textAlt))
            }
        }
        .applyAnimation()
        .task {
            if openGraph == nil {
                self.openGraph = try? await OpenGraph.fetch(url: url, headers: ["User-Agent": "facebookexternalhit/1.1"])
            }
        }
    }
    
    @ViewBuilder
    private func makeInfo(openGraph: OpenGraph) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title = openGraph[.title] {
                Text(title)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .myFont(.bodyM)
                    .myColor(.textNormal)
            }
            let desc = openGraph[.description] ?? "여기를 눌러 링크를 확인하세요."
            Text(desc.emptryThen("여기를 눌러 링크를 확인하세요."))
                .lineLimit(1)
                .truncationMode(.tail)
                .myFont(.labelM)
                .myColor(.textAlt)
            if let domain = url.host {
                Text(domain)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .myFont(.labelM)
                    .myColor(.textAlt)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .myBackground(.background)
    }
    
    @ViewBuilder
    private var emptyImage: some View {
        HStack {
            Spacer()
            Image(icon: .imageLine)
                .resizable()
                .myIconColor(.textAlt)
                .frame(size: 72)
            Spacer()
        }
        .padding(.vertical, 36)
    }
    
    @ViewBuilder
    private func makeImage(_ image: Image) -> some View {
        GeometryReader { geo in
            image
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.width * 9 / 16)
                .clipped()
                .onAppear {
                    imageSize = geo.size
                }
        }
        .frame(height: imageSize.width * 9 / 16)
    }
}
