//
//  CASplitedCircleLayer.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/19.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class CASplitedCircleLayer: CAShapeLayer {


    var startRate: CGFloat = 0.0 {
        didSet {
            recaculateMask()
        }
    }
    var endRate : CGFloat = 1.0 {
        didSet {
            recaculateMask()
        }
    }

    // 缺口大小
    let cutAngle = CGFloat(0.6 * M_PI)
    var cutOffset:CGFloat {
        return self.cutAngle * 0.5
    }

    var rangeOfAngle:CGFloat  {
        return CGFloat(2.0 * M_PI) - cutAngle
    }

    func recaculateMask() {

        let startAngle = startRate * rangeOfAngle + cutOffset
        let endAngle = endRate * rangeOfAngle + cutOffset

        let aPath = UIBezierPath(arcCenter: CGPoint(x: 0.0, y: 0.0), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

//        print("center = \(center)")
//
//        print("start Angle = \(startRate * CASplitedCircleLayer.rangeOfAngle)")
//        print("end Angle = \(endRate * CASplitedCircleLayer.rangeOfAngle)")

        maskLayer.path = aPath.CGPath
        let center = CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
        maskLayer.position = center
    }

    var radius: CGFloat {
        let bounds = self.bounds
        let r = max(bounds.size.width, bounds.size.height) / 4.0
        return r
    }

    private lazy var maskLayer: CAShapeLayer = {
        let theMask = CAShapeLayer()

        theMask.backgroundColor = UIColor.yellowColor().CGColor
//        theMask.bounds = self.bounds
        theMask.lineWidth = 2.0 * self.radius
        theMask.strokeColor = UIColor.redColor().CGColor
        theMask.fillColor = UIColor.clearColor().CGColor

        // 顺时针旋转90˚
        theMask.transform = CATransform3DMakeRotation(CGFloat(0.5 * M_PI), 0.0, 0.0, 1.0)
        self.addSublayer(theMask)

        return theMask
    }()
}
