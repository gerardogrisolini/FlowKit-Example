//
//  TextField.swift
//  
//
//  Created by Gerardo Grisolini on 30/08/23.
//

#if canImport(UIKit)
import Foundation
import UIKit
import SwiftUI
import Combine

public class TextField: UITextField {
    var to: Binding<String>
    var cancellable: AnyCancellable?
 
    public init(to: Binding<String>, borderStyle: BorderStyle = .roundedRect) {
        self.to = to
        super.init(frame: .zero)
        self.text = to.wrappedValue
        self.borderStyle = borderStyle

        cancellable = textPublisher.sink(receiveValue: { text in
            to.wrappedValue = text
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
