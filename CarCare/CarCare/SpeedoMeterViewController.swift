//
//  SpeedoMeterViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/23.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class SpeedoMeterViewController: UIViewController {

    @IBOutlet weak var colorView: SpeedPanel!

    @IBOutlet weak var maskImage: UIImageView!

    var rate:Double = 0.0 {
        didSet {
            colorView.endRate = rate
        }
    }

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!

    var text: String? {
        didSet {
            valueLabel.text = text
        }
    }

    var unitText: String? {
        didSet {
            unitLabel.text = unitText
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


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
