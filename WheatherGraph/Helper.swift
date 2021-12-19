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
    open class func currentStatus(aqi:Double) -> (String,UIColor){
        if aqi >= 0.0 && aqi <= 50.0 {
            return (ConstantValue.GOOD,GradientColor.colorGood)
        }else if aqi > 50.0 && aqi <= 100.0 {
            return (ConstantValue.SATISFACTORY,GradientColor.colorSatisfactory)
        }else if aqi > 100.0 && aqi <= 200.0 {
            return (ConstantValue.MODERATE, GradientColor.colorModerate)
        }else if aqi > 200.0 && aqi <= 300.0 {
            return (ConstantValue.POOR, GradientColor.colorPoor)
        }else if aqi > 300.0 && aqi <= 400.0 {
            return (ConstantValue.VERY_POOR,GradientColor.colorVeryPoor)
        }else  {
            return (ConstantValue.SEVERE,GradientColor.colorSevere)
        }
    }
    
}

