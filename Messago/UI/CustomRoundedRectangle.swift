//
//  CustomRoundedRectangle.swift
//  Messago
//
//  Created by Mohamed El hanafi on 31/12/2024.
//

import SwiftUI

struct CustomRoundedRectangle: Shape {
    var corner: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corner,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
