import SwiftUI

struct FloatingBackground<Content: View>: View {
    
    var content: () -> Content
    var color: Color
    var aligment: Alignment
    
    init(color: Color,
         aligment: Alignment = .center ,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
        self.aligment = aligment
    }
    
    var body: some View {
        ZStack(alignment: aligment) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(color)
                .background(.clear)
                .shadow(color: Color(red: 0.45, green: 0.54, blue: 0.61)
                    .opacity(0.08),
                        radius: 7.5, x: 3, y: 8)
                content()
        }
    }
}
