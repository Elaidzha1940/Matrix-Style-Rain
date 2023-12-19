//  /*
//
//  Project: MatrixStyleRain
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 19.12.2023
//
//  */

import SwiftUI

struct  MatrixStyleRain: View {
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 10) {
                ForEach(1...Int(size.width / 25), id: \.self ) { _ in
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
        
        let constant = "0900909900880900808090"
        
        var body: some View {
            let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
            
            VStack {
                ForEach(0..<constant.count, id: \.self) { index in
                    let charecter = Array(constant)[getRandomIndex(index: index)]
                    Text(String(charecter))
                }
            }
            .mask(alignment: .top) {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [
                            .clear,
                            .black.opacity(0.1),
                            .black.opacity(0.3),
                            .black.opacity(0.5),
                            .black.opacity(0.7),
                            .black
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: size.height / 2)
                    .offset(y: startAnimation ? size.height : -randomHeight)
            }
            .onAppear {
                withAnimation(.linear(duration: 2).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                    startAnimation = true
                }
            }
            .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
                random = Int.random(in: 0..<constant.count)
            }
        }
        func getRandomIndex(index: Int) -> Int {
            let max = constant.count - 1
            
            if (index + random) > max {
                if (index + random) < 0 {
                    return index
                }
                return (index - random)
            } else {
                return (index + random)
            }
        }
    }
}

#Preview {
    MatrixStyleRain()
        .preferredColorScheme(.dark)
}




