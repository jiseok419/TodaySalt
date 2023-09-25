//
//  ContentCell.swift
//  TodaySalt
//
//  Created by 강지석 on 2023/09/25.
//

import SwiftUI

struct ContentCell: View {
    
    @State private var activated: Bool = false
    
    let title: String
    let value: Int
    
    init(_ title: String, _ value: Int) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        Button {
            withAnimation(.spring(dampingFraction: 0.5, blendDuration: 0.2)) {
                activated.toggle()
            }
        } label: {
            VStack(alignment: .leading, spacing: 15) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                if activated {
                    Divider()
                    Text("\(value)kg 완료")
                        .font(.system(size: 15, weight: .regular))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color(.label).opacity(activated ? 0.2 : 0.1))
        }
        .foregroundColor(Color(.label))
        .cornerRadius(10)
    }
}
