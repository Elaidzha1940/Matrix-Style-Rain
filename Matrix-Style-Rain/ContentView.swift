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
            ForEach(0..<constant.count, id: \.self) { index in
                let character = Array(constant)[getRandomIndex(index: index)]
            }
        }
    }
}

struct getRandomIndex(index: Int) -> Int {
    let max = constant.count - 1
    
    if(index + random) > max {
        if(index + random)
    }
}

let constant = "0900909900880900808090"

