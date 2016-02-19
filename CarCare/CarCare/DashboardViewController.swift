//
//  DashboardViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/19.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    var 手刹: Bool! {
        didSet {
            handbreakButton.highlighted = 手刹
        }
    }

    var 机油: Bool! {
        didSet {
            engineerOilButton.highlighted = 机油
        }
    }

    var 仪表盘灯: Bool! {
        didSet {
            lightForDashBoardButton.highlighted = 仪表盘灯
        }
    }

    var 发动机: Bool! {
        didSet {
            engineerButton.highlighted = 发动机
        }
    }

    var 邮箱灯: Bool! {
        didSet {
            fuelOilButton.highlighted = 邮箱灯
        }
    }

    // 控件
    @IBOutlet weak var handbreakButton: UIButton!

    @IBOutlet weak var engineerOilButton: UIButton!

    @IBOutlet weak var lightForDashBoardButton: UIButton!

    @IBOutlet weak var engineerButton: UIButton!

    @IBOutlet weak var fuelOilButton: UIButton!



    override func viewDidLoad() {
        super.viewDidLoad()

        手刹 = false


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
