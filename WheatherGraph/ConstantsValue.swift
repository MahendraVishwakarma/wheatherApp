//
//  ConstantsValue.swift
//  WheatherGraph
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit

public struct ConstantValue {
    static let MAX_AQI = 500.0
    static let ARC_DEGREE = 180.0
    static let PROGRESS_LINE_WIDTH = 30
    static let DEFAULT_LINE_WIDTH = 30
    static let END_ANGLE = 0.0
    static let GOOD = "Good"
    static let SATISFACTORY = "Satisfactory"
    static let MODERATE = "Moderate"
    static let POOR = "Poor"
    static let VERY_POOR = "Very Poor"
    static let SEVERE = "Severe"
    
}

public struct GradientColor {
    static let colorGood = UIColor(red: 70.0/255.0, green: 155.0/255.0, blue: 62.0/255.0, alpha: 1)
    static let colorSatisfactory = UIColor(red: 147.0/255.0, green: 192.0/255.0, blue: 66.0/255.0, alpha: 1)
    static let colorModerate = UIColor(red: 254.0/255.0, green: 250.0/255.0, blue: 65.0/255.0, alpha: 1)
    static let colorPoor = UIColor(red: 237.0/255.0, green: 138.0/255.0, blue: 49.0/255.0, alpha: 1)
    static let colorVeryPoor = UIColor(red: 225.0/255.0, green: 40.0/255.0, blue: 39.0/255.0, alpha: 1)
    static let colorSevere = UIColor(red: 155.0/255.0, green: 28.0/255.0, blue: 28.0/255.0, alpha: 1)
}
