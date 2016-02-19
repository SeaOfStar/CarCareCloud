//
//  DoorViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/15.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class DoorViewController: UIViewController {

    var 左前门: Bool! {
        didSet {
            leftFrontClose.hidden = 左前门
            leftFrontOpen.hidden = !左前门
        }
    }


    var 右前门: Bool! {
        didSet {
            rightFrontClose.hidden = 右前门
            rightFrontOpen.hidden = !右前门
        }
    }


    var 左后门: Bool! {
        didSet {
            leftBackClose.hidden = 左后门
            leftBackOpen.hidden = !左后门
        }
    }

    var 右后门: Bool! {
        didSet {
            rightBackClose.hidden = 右后门
            rightBackOpen.hidden = !右后门
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        左前门 = false
        右前门 = false
        左后门 = false
        右后门 = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // 对应图片

    // 左前
    @IBOutlet weak var leftFrontOpen: UIImageView!
    @IBOutlet weak var leftFrontClose: UIImageView!

    // 右前
    @IBOutlet weak var rightFrontOpen: UIImageView!
    @IBOutlet weak var rightFrontClose: UIImageView!


    // 左后
    @IBOutlet weak var leftBackOpen: UIImageView!
    @IBOutlet weak var leftBackClose: UIImageView!


    // 右后
    @IBOutlet weak var rightBackOpen: UIImageView!
    @IBOutlet weak var rightBackClose: UIImageView!


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
