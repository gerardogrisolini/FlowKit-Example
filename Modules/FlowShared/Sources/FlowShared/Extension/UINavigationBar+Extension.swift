//
//  UINavigationBar+Extension.swift
//  Flow
//
//  Created by Gerardo Grisolini on 13/08/23.
//

#if canImport(UIKit)
import UIKit

public extension UINavigationBar {
    var largeTitleHeight: CGFloat {
        let maxSize = self.subviews
            .filter { $0.frame.origin.y > 0 }
            .max { $0.frame.origin.y < $1.frame.origin.y }
            .map { $0.frame.size }
        return (maxSize?.height ?? 0) + frame.height
    }
}
#endif
