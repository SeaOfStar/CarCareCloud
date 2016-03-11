//
//  SpeedPanel.swift
//  CarCare
//
//  Created by 吴向东 on 16/3/11.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class SpeedPanel: UIView {

    let startColor = UIColor.greenColor()
    let middleColor = UIColor.yellowColor()
    let endColor = UIColor.redColor()

    private var left = CAGradientLayer()
    private var right = CAGradientLayer()

    private var mask = CAShapeLayer()


    override init(frame: CGRect) {
        super.init(frame: frame)

        configDoubleLayer()
        resizeSubLayer()

        layer.addSublayer(left)
        layer.addSublayer(right)

        layer.mask = mask
        updateMask()

        cutCorner()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configDoubleLayer()
        resizeSubLayer()

        layer.addSublayer(left)
        layer.addSublayer(right)

        layer.mask = mask

        updateMask()
        cutCorner()
    }

    private func configDoubleLayer() {
        left.colors = [middleColor.CGColor, startColor.CGColor]
        right.colors = [middleColor.CGColor, endColor.CGColor]
    }

    private func resizeSubLayer() {
        let width = self.bounds.size.width / 2.0
        let height = self.bounds.size.height
        left.frame = CGRect(x: 0, y: 0, width: width, height: height)
        right.frame = CGRect(x: width, y: 0, width: width, height: height)
    }

    private func updateMask() {

        mask.path = path.CGPath
        mask.strokeColor = UIColor.blueColor().CGColor
        mask.fillColor = UIColor.clearColor().CGColor
        mask.lineWidth = radius * 2.0
        self.mask.frame = self.bounds
        mask.backgroundColor = UIColor(white: 1.0, alpha: 0.2).CGColor
    }

    private var path: UIBezierPath {
        let center = CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)

        NSLog("center = \(center)")
        let p = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.75 * CGFloat(M_PI), endAngle: 0.25 * CGFloat(M_PI), clockwise: true)

        return p
    }

    private var radius: CGFloat {
        return max(bounds.size.width, bounds.size.height) / 4.0
    }


    var endRate: Double = 0.0 {
        didSet {
            self.mask.strokeEnd = CGFloat(endRate)
        }
    }


    private func cutCorner() {
        self.layer.cornerRadius = min(self.bounds.size.width, self.bounds.size.height) / 2.0

        self.layer.masksToBounds = true
    }

}