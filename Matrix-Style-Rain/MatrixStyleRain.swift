//  /*
//
//  Project: MatrixStyleRain
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 19.12.2023
//
//  */

import SwiftUI

struct MatrixStyleRain: View {
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 10) {
                ForEach(1...Int(size.width / 20), id: \.self) { _ in
                    Rain(size: size)
                }
            }
            .padding(.horizontal)
        }
    }
    
    struct Rain: View {
        var size: CGSize
        
        @State private var startAnimation: Bool = false
        @State private var random: Int = 0
        
        var body: some View {
            let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
            
            VStack {
                ForEach(0..<max(0, min(constant.count, 40)), id: \.self) { index in
                    if let character = Array(constant)[safe: index] {
                        Text(String(character))
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                }
            }
            .mask(alignment: .top) {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [
                            .clear,
                            .black.opacity(0.1),
                            .black.opacity(0.4),
                            .black.opacity(0.7),
                            .gray,
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: size.height / 2)
                    .offset(y: startAnimation ? size.height : -randomHeight)
            }
            .onAppear {
                withAnimation(Animation.linear(duration: 2).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                    startAnimation = true
                }
            }
            .onReceive(Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()) { _ in
                random = Int.random(in: 0..<constant.count)
            }
        }
    }
}

struct MatrixStyleRain_Previews: PreviewProvider {
    static var previews: some View {
        MatrixStyleRain()
            .preferredColorScheme(.dark)
    }
}

let constant = "3.141592653589793 3.141592653589793"

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
