//
//  Helper.swift
//  WheatherGraph
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit

class Helper {
    // convert a double value into radians
    open class func radians<T: FloatingPoint>(degrees: T) -> T {
        return .pi * degrees / T(Int(ConstantValue.ARC_DEGREE))
    }

    // convert a double value into degree
    open class func degrees<T: FloatingPoint>(radians: T) -> T {
        return radians * T(Int(ConstantValue.ARC_DEGREE)) / .pi
    }
    
    open class func calculateAQIPercentage(aqi:Double) -> CGFloat {
        let apiPercentage = aqi/ConstantValue.MAX_AQI
        let percentage = ConstantValue.ARC_DEGREE + ConstantValue.ARC_DEGREE*apiPercentage
        return CGFloat(percentage)
    }
    
}

