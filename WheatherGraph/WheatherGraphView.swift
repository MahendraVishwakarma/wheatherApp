//
//  WheatherGraphView.swift
//  WheatherGraph
//
//  Created by Mahendra Vishwakarma on 18/12/21.
//

import Foundation
import UIKit


public class WheatherGraphView:UIView {
    
    let shapeLayer = CAShapeLayer()
    var messageLabel: UILabel?
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
        createProgressLayer(aqi: api)
    }
    private func initializeView() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.layer.addSublayer(shapeLayer)
        
        let messgeRect = CGRect(x: 10, y: Int((self.frame.height))/2+Int((self.frame.height))/6, width: Int(self.frame.width)-20, height: 20)
        if self.viewWithTag(1234) == nil {
            messageLabel = UILabel(frame:messgeRect)
            messageLabel?.tag = 1234
            if let label = messageLabel {
                self.addSubview(label)
            }
        }
       
        
    }
    
    //creates progress layer in view
    private func createProgressLayer(aqi:Double) {
        
        let result =  Helper.currentStatus(aqi: aqi)
        let apiPercentage = Helper.calculateAQIPercentage(aqi: aqi)
        let startAnglee = Helper.radians(degrees: ConstantValue.ARC_DEGREE)
        let endAnglee = Helper.radians(degrees: apiPercentage)
        
        let path = UIBezierPath(arcCenter: CGPoint(x:(self.frame.width)/2, y:(self.frame.height)/2), radius: (self.frame.height)/2, startAngle: CGFloat(startAnglee), endAngle: CGFloat(endAnglee), clockwise: true)
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = .none
        //shapeLayer.lineDashPattern = [10, 3]
        shapeLayer.lineWidth = CGFloat(ConstantValue.PROGRESS_LINE_WIDTH)
        shapeLayer.lineCap = .butt
        shapeLayer.strokeColor = UIColor.orange.cgColor
        
        messageLabel?.textAlignment = .center
        messageLabel?.text = result.0 + " " + "(AQI: \(aqi))"
        messageLabel?.textColor = result.1
         
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
