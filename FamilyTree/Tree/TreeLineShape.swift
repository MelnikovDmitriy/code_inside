//
//  Line.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import SwiftUI

struct TreeLineShape: Shape {
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    var animatableData: AnimatablePair<CGPoint, CGPoint> {
        get { AnimatablePair(startPoint, endPoint) }
        
        set {
            startPoint = newValue.first
            endPoint = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: startPoint)
            path.addLine(to: endPoint)
        }
    }
}

extension CGPoint: VectorArithmetic {
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public mutating func scale(by rhs: Double) {
        self = .init(x: x * rhs, y: y * rhs)
    }
    
    public var magnitudeSquared: Double {
        1.0
    }
    
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
