//
//  WheatherGraphView.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit

class WheatherGraphView:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
        
        //  fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        initializeView()
        createTamplateProgressLayer()
        createProgressLayer(api: 90.0)
    }
    private func initializeView() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
      
    }
    private func createProgressLayer(api:Double) {
        let apiPercentage = 360.0 - 90.0
        let startAnglee = radians(degrees: 180.0)
        let endAnglee = radians(degrees: apiPercentage)
        //x:self.view.frame.width/4, y:self.view.frame.height/4
        let path = UIBezierPath(arcCenter: CGPoint(x:self.frame.width/2, y:self.frame.height/2), radius: self.frame.height/2, startAngle: CGFloat(startAnglee), endAngle: CGFloat(endAnglee), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.backgroundColor?.cgColor
        shapeLayer.lineWidth = 30
        shapeLayer.lineCap = .square
        shapeLayer.strokeColor = UIColor.red.cgColor
        
       
        
        self.layer.addSublayer(shapeLayer)
    }
    private func createTamplateProgressLayer() {
        
        let startAnglee = radians(degrees: 180.0)
        let endAnglee = radians(degrees: 0)
        //x:self.view.frame.width/4, y:self.view.frame.height/4
        let path = UIBezierPath(arcCenter: CGPoint(x:self.frame.width/2, y:self.frame.height/2), radius: self.frame.height/2, startAngle: CGFloat(startAnglee), endAngle: CGFloat(endAnglee), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.backgroundColor?.cgColor
        shapeLayer.lineWidth = 30
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
       
        
        self.layer.addSublayer(shapeLayer)
    }
    public func radians<T: FloatingPoint>(degrees: T) -> T {
        return .pi * degrees / 180
    }

    public func degrees<T: FloatingPoint>(radians: T) -> T {
        return radians * 180 / .pi
    }
}

class Colors {
    var gl:CAGradientLayer!

    init() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                 

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
