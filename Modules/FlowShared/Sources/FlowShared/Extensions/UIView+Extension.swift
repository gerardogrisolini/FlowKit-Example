//
//  UIView+Extension.swift
//  Flow
//
//  Created by Gerardo Grisolini on 12/08/23.
//

#if canImport(UIKit)
import UIKit

public extension UIView {

    func anchoringTo(
        boundsOf view: UIView,
        top: CGFloat? = 0,
        bottom: CGFloat? = 0,
        leading: CGFloat? = 0,
        trailing: CGFloat? = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        if let top {
            constraints.append(topAnchor.constraint(equalTo: view.topAnchor, constant: top))
        }
        if let bottom {
            constraints.append(bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom))
        }
        if let leading {
            constraints.append(leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading))
        }
        if let trailing {
            constraints.append(trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil,
        paddingBottom: CGFloat = 0,
        leading: NSLayoutXAxisAnchor? = nil,
        paddingLeading: CGFloat = 0,
        trailing: NSLayoutXAxisAnchor? = nil,
        paddingTrailing: CGFloat = 0,
        width: CGFloat = 0,
        height: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    static var spacer: UIView {
        let spacer = UIView()
//        spacer.isUserInteractionEnabled = false
//        spacer.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
//        spacer.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        let spacerConstraint = spacer.heightAnchor.constraint(equalToConstant: .greatestFiniteMagnitude) // or some very high constant
        spacerConstraint.priority = .defaultLow // ensures it will not "overgrow"
        spacerConstraint.isActive = true
        return spacer
    }
}
#endif
