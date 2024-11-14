//
//  TabItem.swift
//  ilCubatore
//
//  Created by Gerardo Grisolini on 21/09/24.
//

import SwiftUI

public struct TabItem: View {
    let title: String
    let imageName: String
    let isActive: Bool
    
    public init(title: String, imageName: String, isActive: Bool = false) {
        self.title = title
        self.imageName = imageName
        self.isActive = isActive
    }
    
    public var body: some View {
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .brown : .gray)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .foregroundColor(isActive ? .brown : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? 160 : 50, height: 50)
        .background(isActive ? .green.opacity(0.4) : .clear)
        .cornerRadius(25)
        .animation(.easeInOut(duration: 0.5), value: isActive)
    }
}

