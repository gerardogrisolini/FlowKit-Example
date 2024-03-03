//
//  UITextField+Extension.swift
//
//
//  Created by Gerardo Grisolini on 30/08/23.
//

#if canImport(UIKit)
import UIKit
import SwiftUI
import Combine

public extension UITextField {
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }
    
    func binding(to: Binding<String>) {
        _ = textPublisher.sink(receiveValue: { text in
            to.wrappedValue = text
        })
    }
}
#endif
