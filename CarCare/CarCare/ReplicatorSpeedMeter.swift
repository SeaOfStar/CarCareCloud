//
//  ReplicatorSpeedMeter.swift
//  CarCare
//
//  Created by 吴向东 on 16/3/11.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class ReplicatorSpeedMeter: UIView {

    override class func layerClass() -> AnyClass {
        return CAReplicatorLayer.self
    }

    private var replicatorLayer: CAReplicatorLayer! {
        return self.layer as! CAReplicatorLayer
    }

    var repeatCount: Int = 1 {
        didSet {
            self.replicatorLayer.instanceCount = repeatCount
        }
    }

    private var rect: CALayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configLayer()
    }

    private func configLayer() {
        let count = 60.0
//        replicatorLayer.instanceColor = UIColor.greenColor().CGColor;
        replicatorLayer.instanceRedOffset = Float(1.0 / count)
        replicatorLayer.instanceGreenOffset = Float(-1.0 / count)
        replicatorLayer.instanceCount = Int(count * 0.75)
//        replicatorLayer.instanceDelay = CFTimeInterval(1 / 40.0)

//        replicatorLayer.borderColor = UIColor.blueColor().CGColor
//        replicatorLayer.borderWidth = 3.0

        let angle = CGFloat(M_PI * 2.0 / count)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
//        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0)

        let bar = CALayer()
        bar.bounds = CGRect(x: 0.0, y: 0.0, width: 5.0, height: 10.0)
        bar.position = CGPoint(x: bounds.size.width / 2.0, y: 6.0)
        bar.backgroundColor = UIColor.greenColor().CGColor

        replicatorLayer.addSublayer(bar)

        replicatorLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI * 1.25), 0.0, 0.0, 1.0)
    }

}
