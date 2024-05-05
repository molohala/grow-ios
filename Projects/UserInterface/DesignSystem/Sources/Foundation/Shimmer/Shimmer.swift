import SwiftUI

public struct Shimmer<C: View>: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    
    @State private var startPoint: UnitPoint = .init(x: -1.8, y: 0)
    @State private var endPoint: UnitPoint = .init(x: 0, y: 0)
    
    private let content: () -> C
    
    public init(@ViewBuilder content: @escaping () -> C) {
        self.content = content
    }
    
    public var body: some View {
        
        let color = GrowPallete.shared.Neutral50
        let added = colorProvider.isDarkTheme ? 0.5 : 0
        
        content()
            .redacted(reason: .placeholder)
            .mask(
                LinearGradient(
                    colors: [
                        color.opacity(0.15 + added),
                        color.opacity(0.05 + added),
                        color.opacity(0.15 + added)
                    ],
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )
            .onAppear {
                withAnimation(
                    .linear(duration: 1.5)
                    .repeatForever(autoreverses: false)
                ) {
                    startPoint = .init(x: 1, y: 0)
                    endPoint = .init(x: 2.2, y: 0)
                }
            }
    }
}
