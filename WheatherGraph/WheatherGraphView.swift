//
//  WheatherGraphView.swift
//  WheatherGraph
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit


public class WheatherGraphView:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
        //  fatalError("init(coder:) has not been implemented")
    }
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        initializeView()
        createTamplateProgressLayer()
       
    }
    //set api value . call this method from viewController to update data
    public func setAQI(api:Double) {
        createProgressLayer(api: api)
    }
    private func initializeView() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
    private func createProgressLayer(api:Double) {
        let apiPercentage = Helper.calculateAQIPercentage(aqi: api)
        let startAnglee = Helper.radians(degrees: ConstantValue.ARC_DEGREE)
        let endAnglee = Helper.radians(degrees: apiPercentage)
        
        let path = UIBezierPath(arcCenter: CGPoint(x:(self.frame.width)/2, y:(self.frame.height)/2), radius: (self.frame.height)/2, startAngle: CGFloat(startAnglee), endAngle: CGFloat(endAnglee), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = .none
        shapeLayer.lineWidth = CGFloat(ConstantValue.PROGRESS_LINE_WIDTH)
        //shapeLayer.lineCap = .square
        shapeLayer.strokeColor = UIColor.red.cgColor
        self.layer.addSublayer(shapeLayer)
    }
    // this method is responsible to add default layer on view
    private func createTamplateProgressLayer() {
        
        let startAnglee = Helper.radians(degrees: ConstantValue.ARC_DEGREE)
        let endAnglee = Helper.radians(degrees: ConstantValue.END_ANGLE)
        let layerPoint = CGPoint(x:self.frame.width/2, y:self.frame.height/2)
        
        let path = UIBezierPath(arcCenter: layerPoint, radius: self.frame.height/2, startAngle: CGFloat(startAnglee), endAngle: CGFloat(endAnglee), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.backgroundColor?.cgColor
        shapeLayer.lineWidth = CGFloat(ConstantValue.DEFAULT_LINE_WIDTH)
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
    
        let gradientLayer = UIColor.GradientLayer()
        gradientLayer.frame = path.bounds
        shapeLayer.addSublayer(gradientLayer)
        
        shapeLayer.insertSublayer(gradientLayer, at: 0)
        self.layer.insertSublayer(shapeLayer, at: 0)
      
    }
    
}
