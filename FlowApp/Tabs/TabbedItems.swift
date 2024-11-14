//
//  TabbedItems.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 07/10/24.
//

enum TabbedItems: Hashable, CaseIterable {
    case swiftUI
    case uiKit
    case data
    
    var title: String {
        switch self {
        case .swiftUI:
            return "SwiftUI"
        case .uiKit:
            return "UIKit"
        case .data:
            return "Data"
        }
    }
    
    var iconName: String {
        switch self {
        case .swiftUI:
            return "house.fill"
        case .uiKit:
            return "tray.and.arrow.down.fill"
        case .data:
            return "person.crop.circle"
        }
    }
}
