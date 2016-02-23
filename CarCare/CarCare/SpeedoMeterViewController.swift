//
//  SpeedoMeterViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/23.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class SpeedoMeterViewController: UIViewController {

    @IBOutlet weak var colorImage: UIImageView!
    @IBOutlet weak var maskImage: UIImageView!

    var maskLayer = CASplitedCircleLayer()
//    var maskLayer = CAShapeLayer()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        maskLayer.bounds = colorImage.bounds
        maskLayer.startRate = 0.0
        maskLayer.endRate = 0.5

        maskLayer.borderColor = UIColor.blueColor().CGColor
        maskLayer.borderWidth = 3.0

//        maskLayer.backgroundColor = UIColor(red: 0.6, green: 0.7, blue: 0.7, alpha: 0.5).CGColor
        maskLayer.position = CGPoint(x: colorImage.bounds.size.width / 2.0, y: colorImage.bounds.size.height / 2.0)

        colorImage.layer.mask = maskLayer
//        colorImage.layer.addSublayer(maskLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
