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
        gradientLayer.colors = .GradientColors()
        return gradientLayer
    }
}

extension Array {
    public static func GradientColors() -> [CGColor] {
        let colorGood = UIColor(red: 70.0/255.0, green: 55.0/155.0, blue: 62.0/255.0, alpha: 1).cgColor
        let colorSatisfactory = UIColor(red: 147.0/255.0, green: 192.0/155.0, blue: 66.0/255.0, alpha: 1).cgColor
        let colorModerate = UIColor(red: 254.0/255.0, green: 250.0/155.0, blue: 65.0/255.0, alpha: 1).cgColor
        let colorPoor = UIColor(red: 237.0/255.0, green: 138.0/155.0, blue: 49.0/255.0, alpha: 1).cgColor
        let colorVeryPoor = UIColor(red: 225.0/255.0, green: 40.0/155.0, blue: 39.0/255.0, alpha: 1).cgColor
        let colorSevere = UIColor(red: 155.0/255.0, green: 28.0/155.0, blue: 27.0/255.0, alpha: 1).cgColor
        return [colorGood, colorSatisfactory, colorModerate, colorPoor, colorVeryPoor, colorSevere]
    }
}
