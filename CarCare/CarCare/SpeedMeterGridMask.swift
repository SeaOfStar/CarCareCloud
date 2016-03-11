//
//  SpeedMeterGridMask.swift
//  CarCare
//
//  Created by 吴向东 on 16/3/11.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class SpeedMeterGridMask: UIView {

    private var gridLayer = CAReplicatorLayer()
    private var maskLayer = CALayer()

    func loadGrid() {
        // 完整的孔的数量
        let count = 60.0

        gridLayer.frame = self.bounds

        gridLayer.instanceCount = Int(count * 0.75)

        let angle = CGFloat(M_PI * 2.0 / count)
        gridLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)

        // 一个孔的形状
        let bar = CALayer()
        bar.bounds = CGRect(x: 0.0, y: 0.0, width: 5.0, height: 10.0)
        bar.position = CGPoint(x: bounds.size.width / 2.0, y: 6.0)
        bar.backgroundColor = UIColor.greenColor().CGColor

        gridLayer.addSublayer(bar)

        gridLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI * 1.25), 0.0, 0.0, 1.0)


        maskLayer.frame = self.bounds
        // 什么颜色不重要，关键是不透明
        maskLayer.backgroundColor = UIColor.blackColor().CGColor

        // 为了修剪成圆形，需要最大半径
        let corner = min(bounds.size.width, bounds.size.height) / 2.0
        maskLayer.cornerRadius = corner
        maskLayer.masksToBounds = true

//        self.layer.addSublayer(gridLayer)
//        self.layer.mask = gridLayer

        self.layer.mask = maskLayer
//        maskLayer.mask = gridLayer
//        self.layer.addSublayer(maskLayer)
    }

}
