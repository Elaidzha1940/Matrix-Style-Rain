//  /*
//
//  Project: Matrix-Style-Rain
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 19.12.2023
//
//  */

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 10) {
                ForEach(1...Int(size.width / 25), id: \.self ) { _ in
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}

struct Rain: View {
    var size: CGSize
    
    @State var startAnimation: Bool = false
    @State var random: Int = 0
    
    var body: some View {
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack {
            
        }
        .mask(alignment: .top) {
            Rectangle()
                .fill()
            LinearGradient(colors: [
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.2),
                .black.opacity(0.3),
                .black.opacity(0.4),
                .black.opacity(0.5),
                .black
            ],
                           startPoint: .top,
                           endPoint: .bottom)
            .frame(height: size.height / 2)
            .offset(y: startAnimation ? size.height : -randomHeight)
            
        }
        .onAppear {
            withAnimation(.linear(duration: 2).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                
            }
        }
    }
}

func getRandomIndex(index: Int) -> Int {
    let max = constant.count - 1
    
    if(index + random) > max {
        if(index + random) < 0 {
            return index
        }
        return(index - random)
    } else {
        return(index + random)
        
    }
}

let constant = "0900909900880900808090"

//ForEach(0..<constant.count, id: \.self) { index in
//    let character = Array(constant)[getRandomIndex(index: index)]
//    Text(String(character))
//}
