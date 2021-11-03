//
//  CircleGroupView.swift
//  Restart
//
//  Created by Piotr Szerszeń on 29/10/2021.
//

import SwiftUI

struct CircleGroupView: View {

    private let circleSize: CGFloat = 260

    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: circleSize, height: circleSize, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: circleSize, height: circleSize, alignment: .center)
        } //:ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - PREVIEW
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
