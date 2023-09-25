//
//  ContentView.swift
//  TodaySalt
//
//  Created by 강지석 on 2023/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { outsideProxy in
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
                        let scale = -offset / (outsideProxy.size.width / 4 * 3) + 1
                        Image("Slave")
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(scale, anchor: .top)
                            .offset(y: offset)
                        LinearGradient(colors: [.black, .clear],
                                       startPoint: .bottom,
                                       endPoint: .top)
                        .frame(height: 100)
                        .opacity(0.8)
                        HStack(alignment: .bottom) {
                            Text("오늘의 소금")
                                .font(.system(size: 30, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .scaleEffect(scale, anchor: .bottomLeading)
                            Spacer()
                            Text("by 노지석")
                                .font(.system(size: 15, weight: .regular))
                                .scaleEffect(scale, anchor: .bottomTrailing)
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                    VStack(alignment: .leading) {
                        ContentCell("천일염", 818)
                        ContentCell("죽염", 523)
                        ContentCell("히말라야 핑크솔트", 518)
                    }
                    .padding()
                }
                .overlay(
                    GeometryReader { insideProxy in
                        EmptyView()
                            .onChange(of: insideProxy.frame(in: .global).minY) {
                                let value = outsideProxy.frame(in: .global).minY - $0
                                offset = value < 0 ? value : 0
                            }
                    }
                )
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
