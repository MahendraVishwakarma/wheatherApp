//
//  ColorExtension.swift
//  WheatherGraph
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit

extension UIColor {
    open class func GradientLayer() -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = .WeatherGraphGradientColors()
        return gradientLayer
    }
}

extension Array {
     static fileprivate func WeatherGraphGradientColors() -> [CGColor] {
        let colorGood = GradientColor.colorGood.cgColor
        let colorSatisfactory = GradientColor.colorSatisfactory.cgColor
        let colorModerate = GradientColor.colorModerate.cgColor
        let colorPoor = GradientColor.colorPoor.cgColor
        let colorVeryPoor = GradientColor.colorVeryPoor.cgColor
        let colorSevere = GradientColor.colorSevere.cgColor
        return [colorGood, colorSatisfactory, colorModerate, colorPoor, colorVeryPoor, colorSevere]
    }
}
