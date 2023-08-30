import SwiftUI

struct Constants {

    static let defaultGradient = LinearGradient(stops: [
        Gradient.Stop(color: Color(red: 0.5, green: 0.9, blue: 1), location: 0.00),
        Gradient.Stop(color: Color(red: 0, green: 0.82, blue: 1), location: 1.00),
    ],
                                                startPoint: UnitPoint(x: 0.81, y: -1.02),
                                                endPoint: UnitPoint(x: 0.42, y: 1.07))
    static let activatedGradient = LinearGradient(stops: [
        Gradient.Stop(color: Color(red: 0.7, green: 1, blue: 0.3), location: 0.00),
        Gradient.Stop(color: Color(red: 0.51, green: 0.89, blue: 0.2), location: 1.00),
    ],
                                                  startPoint: UnitPoint(x: 0.81, y: -1.02),
                                                  endPoint: UnitPoint(x: 0.42, y: 1.07))
    static let defaultBorderColor: Color = .red
    static let activeBorderColor = Color(red: 0.51, green: 0.89, blue: 0.2)
    static let defaultTitle = "COMPLETE YOUR PROFILE"
    static let defaultSubTitle = "Take a few steps to show the kommunity who you really are"
}
