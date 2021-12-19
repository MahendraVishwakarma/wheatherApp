//
//  WeatherModel.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 17/12/21.
//

import Foundation

// MARK: - WheatherModelElement
struct WheatherModelElements: Codable {
    let city: String
    let aqi: Double
}

typealias WheatherModel = [WheatherModelElements]

