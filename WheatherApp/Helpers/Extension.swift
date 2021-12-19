//
//  WebServicesExtension.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 17/12/21.
//

import Foundation
import UIKit

extension UIColor {
    public class func GradientLayer(colors:[CGColor]) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        return gradientLayer
    }
}

extension UIView {

    func setShadow(color: UIColor,cornerRadius:CGFloat = 0.0, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    layer.cornerRadius = cornerRadius
    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
