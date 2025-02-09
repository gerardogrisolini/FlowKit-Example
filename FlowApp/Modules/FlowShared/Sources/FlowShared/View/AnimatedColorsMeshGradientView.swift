//
//  AnimatedColorsMeshGradientView.swift
//  Shared
//
//  Created by Gerardo Grisolini on 07/10/24.
//

import SwiftUI

public struct AnimatedColorsMeshGradientView: View {
    private let colors: [Color] = [
        Color(red: 1.00, green: 0.42, blue: 0.42),
        Color(red: 1.00, green: 0.55, blue: 0.00),
        Color(red: 1.00, green: 0.27, blue: 0.00),
        
        Color(red: 1.00, green: 0.41, blue: 0.71),
        Color(red: 0.85, green: 0.44, blue: 0.84),
        Color(red: 0.54, green: 0.17, blue: 0.89),
        
        Color(red: 0.29, green: 0.00, blue: 0.51),
        Color(red: 0.00, green: 0.00, blue: 0.55),
        Color(red: 0.10, green: 0.10, blue: 0.44)
    ]
    
    private let points: [SIMD2<Float>] = [
        SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
        SIMD2<Float>(0.0, 0.5), SIMD2<Float>(0.5, 0.5), SIMD2<Float>(1.0, 0.5),
        SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0)
    ]
    
    public init() { }
}

extension AnimatedColorsMeshGradientView {
    public var body: some View {
        TimelineView(.animation) { timeline in
            MeshGradient(
                width: 3,
                height: 3,
                locations: .points(points),
                colors: .colors(animatedColors(for: timeline.date)),
                background: .black,
                smoothsColors: true
            )
        }
        .ignoresSafeArea()
    }
}

extension AnimatedColorsMeshGradientView {
    private func animatedColors(for date: Date) -> [Color] {
        let phase = CGFloat(date.timeIntervalSince1970)
        
        return colors.enumerated().map { index, color in
            let hueShift = cos(phase + Double(index) * 0.3) * 0.1
            return shiftHue(of: color, by: hueShift)
        }
    }
    
    private func shiftHue(of color: Color, by amount: Double) -> Color {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
#if canImport(UIKit)
        UIColor(color).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
#else
        NSColor(color).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
#endif
        hue += CGFloat(amount)
        hue = hue.truncatingRemainder(dividingBy: 1.0)
        
        if hue < 0 {
            hue += 1
        }
        
        return Color(hue: Double(hue), saturation: Double(saturation), brightness: Double(brightness), opacity: Double(alpha))
    }
}

#Preview {
    AnimatedColorsMeshGradientView()
}
