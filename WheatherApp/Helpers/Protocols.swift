//
//  Protocols.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 19/12/21.
//

import Foundation

protocol WebResponseDelegate:AnyObject {
    func update(status:Status,message:String?)
    func updateTime(time:Int?)
}
