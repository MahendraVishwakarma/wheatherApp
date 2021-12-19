//
//  Utils.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit
struct Utils {
    static let websocketURL = "ws://city-ws.herokuapp.com/"
}

//Result type
public enum Result<T, U> where U:Error {
    case success(T)
    case failure(U)
}

// custom error
public enum APIError:Error {
    case failedRequest(String?)
    case invalidData
}
public enum Status {
    case success
    case failed
}
enum DashboardGradientColors {
    case top
    case bottom
    var value: CGColor {
        get {
            switch self {
            case .bottom:
                return UIColor(red: 135.0/255.0, green: 206.0/255, blue: 250.0/255, alpha: 0.5).cgColor
            case .top:
                return UIColor.blue.cgColor
                //return UIColor(red: 29.0/255.0, green: 98.0/255, blue: 233.0/255, alpha: 1.0).cgColor
            }
        }
    }
}
