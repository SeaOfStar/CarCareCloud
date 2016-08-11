//
//  CarParamTableViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/3/9.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class CarParamTableViewController: UITableViewController {

    // MARK: - 子画面
    private var speedMeter: SpeedoMeterViewController!
    private var angelMeter: SpeedoMeterViewController!
    private var statusPanel: DashboardViewController!

    // 电机或者电池的子画面
    private weak var paramSubControl: UnitParamViewController?


    // cell
    @IBOutlet weak var statusPanelCell: UITableViewCell!
    @IBOutlet weak var 车辆状态cell: UITableViewCell!


    // 用于控制外围透明边框的view
    @IBOutlet weak var baseViewForStatusPanel: UIView!
    @IBOutlet weak var baseViewForMainStatus: UIView!
    @IBOutlet weak var baseViewFor续航: UIView!
    @IBOutlet weak var baseViewFor发动机: UIView!
    @IBOutlet weak var baseViewFor电池组: UIView!
    @IBOutlet weak var baseViewFor视频: UIView!
    @IBOutlet weak var baseViewFor空调: UIView!
    @IBOutlet weak var baseViewFor地图: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.addEdgeForCell()

        self.angelMeter.unitText = "rpm"

    }

    private func addEdgeForCell() {
        CarParamTableViewController.cutViewEdge(baseViewForMainStatus)
        CarParamTableViewController.cutViewEdge(baseViewForStatusPanel)
        CarParamTableViewController.cutViewEdge(baseViewFor续航)
        CarParamTableViewController.cutViewEdge(baseViewFor发动机)
        CarParamTableViewController.cutViewEdge(baseViewFor电池组)
        CarParamTableViewController.cutViewEdge(baseViewFor视频)
        CarParamTableViewController.cutViewEdge(baseViewFor空调)
        CarParamTableViewController.cutViewEdge(baseViewFor地图)
    }

    private var coreData: [String: AnyObject]!

    private var vehicleData: [String : AnyObject]?
    private var driveData: [String : AnyObject]?
    private var batteryData: [String: AnyObject]?
    private var locationData: [String: AnyObject]?


    func reloadWithData(data: [String: AnyObject]?) {
        if let theData = data {
            self.coreData = theData

            // 汽车数据
            if let vehicleData = theData["vehicle"] {
                self.vehicleData = vehicleData as? [String : AnyObject]
            }

            // 驾驶信息
            if let driveData = theData["drive"] {
                self.driveData = driveData as? [String: AnyObject]
            }

            // 电池数据
            if let betteryData = theData["battery"] {
                self.batteryData = betteryData as? [String: AnyObject]
            }

            if let locationData = theData["location"] {
                self.locationData = locationData as? [String: AnyObject]
            }

            self.reload()
        }
    }

    private func reload() {
        // 更新速度表
        self.reloadSpeedMeter()

        // 更新状态面板
        self.reloadStatusPanel()

        // 更新整体状态
        self.reloadMainStatus()

        // 更新续航情况
        self.reloadEndurance()

        // 更新发动机参数
        self.reloadDrive()

        // 更新电池相关
        self.reloadBattery()

        // 更新子页面
        self.reloadSubController()
    }

    private func reloadSubController() {

        if let sub = self.paramSubControl {
            // 根据子页面的属性判断赋何值
            if sub.isBattery {
                sub.dataSource = self.batteryData
            }
            else {
                sub.dataSource = self.driveData
            }
            sub.reloadData()
        }
    }

    // MARK: 电池情况

    @IBOutlet weak var 总电压label: UILabel!
    @IBOutlet weak var 总电流label: UILabel!
    @IBOutlet weak var 总功率label: UILabel!

    @IBOutlet weak var 电池数量label: UILabel!

    private func reloadBattery() {
//        NSLog("battery Data = \r\(self.batteryData)")

        if let volt = self.batteryData?["volt"] as? Double {
            let voltValue = volt * 0.1
            self.总电压label.text = String(format: "%.2fv", voltValue)
        }

        if let power = self.batteryData?["power"] as? Double {
            let powerValue = power * 0.01
            self.总功率label.text = String(format: "%.2fkw", powerValue)
        }


        if let 电流 = self.batteryData?["current"] as? Double {
            let 安培数 = 电流 * 0.1
            self.总电流label.text = String(format: "%.2fA", 安培数)
        }


        // 设备数
        if let units = self.batteryData?["units"] as? NSArray {
            self.电池数量label.text = "\(units.count)块电池"
        }
    }



    // MARK: 续航情况
    @IBOutlet weak var 百公里耗电Label: UILabel!
    @IBOutlet weak var 可续航里程label: UILabel!
    @IBOutlet weak var 累计里程label: UILabel!

    private func reloadEndurance() {
        if let oil = self.driveData?["consumption"] as? Int {
            let kwh = Double(oil) * 0.1
            self.百公里耗电Label.text = "\(kwh)度"
        }

        if let remain = self.driveData?["remaining"] as? Float {
            self.可续航里程label.text = String(format: "%.2fkm", remain)
        }

        if let finish = self.driveData?["kilometerage"] as? Float {
            self.累计里程label.text = String(format: "%.2fkm", finish)
        }
    }


    private func reloadSpeedMeter() {
        if let theDriverInfo = self.driveData {
            if let speed = theDriverInfo["speed"] {
//                let speedValue = speed as! Double * 0.1     // 单位0.1km/h
                let speedValue = speed as! Double     // 单位km/h
                speedMeter.rate = speedValue / 260.0
                speedMeter.text = String(format: "%.2f", speedValue);
            }

            // 这个地方具体的业务逻辑不太清楚，等问问翟
            if let unitsInfo = theDriverInfo["units"] {
                let units = unitsInfo as! [[String : AnyObject]]
                if let rpm = units.first?["rpm"] {
                    let rate = rpm as! Double / 8864.0
                    angelMeter.rate = rate
                    angelMeter.text = "\(rpm)"
                }
            }
        }
    }



    private func reloadStatusPanel() {

    }


    // MARK: 整体状态
    @IBOutlet weak var 整体车辆状态label: UILabel!
    @IBOutlet weak var 整体驱动器状态label: UILabel!
    @IBOutlet weak var 整体电池状态label: UILabel!
    @IBOutlet weak var 整体定位状态label: UILabel!

    func reloadMainStatus() {
        整体车辆状态label.text = self.vehicleData?["status"] as? String
        整体驱动器状态label.text = self.driveData?["status"] as? String
        整体电池状态label.text = self.batteryData?["status"] as? String
        整体定位状态label.text = self.locationData?["status"] as? String
    }




    // MARK: 发动机相关
    @IBOutlet weak var driverVersionLabel: UILabel!
    @IBOutlet weak var seriesNumberLabel: UILabel!
    @IBOutlet weak var driveSpeedLabel: UILabel!
    @IBOutlet weak var 发动机数量label: UILabel!


    private func reloadDrive() {

        if let theDriverInfo = self.driveData {

//            NSLog("\(theDriverInfo)\r\r\r")

            if let versionString = theDriverInfo["softver"] {
                self.driverVersionLabel.text = versionString as? String
            }

            if let snString = theDriverInfo["sn"] {
                self.seriesNumberLabel.text = snString as? String
            }

            if let speed = theDriverInfo["speed"] {
                let speedValue = speed as! Double * 0.1 // 单位是0.1 km/h
                self.driveSpeedLabel.text = String(format: "%.2f", speedValue)
            }

            // 设备数
            if let unitsInfo = theDriverInfo["units"] {
                let units = unitsInfo as! NSArray
                self.发动机数量label.text = "\(units.count)台设备"
            }
        }
    }


    class func cutViewEdge(view : UIView) {
        let layer = view.layer
//        layer.borderColor = UIColor.clearColor().CGColor
//        layer.borderWidth = 5
        layer.cornerRadius = 6

        view.clipsToBounds = true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        switch segue.identifier! {
        case "时速表":
            self.speedMeter = segue.destinationViewController as! SpeedoMeterViewController

        case "转速表":
            self.angelMeter = segue.destinationViewController as! SpeedoMeterViewController

        case "状态面板":
            self.statusPanel = segue.destinationViewController as! DashboardViewController

        case "电池组详细":
            let subParamController = segue.destinationViewController as! UnitParamViewController
            subParamController.isBattery = true
            subParamController.dataSource = self.batteryData
            self.paramSubControl = subParamController

        case "电机详细":
            let subParamController = segue.destinationViewController as! UnitParamViewController
            subParamController.isBattery = false
            subParamController.dataSource = self.driveData
            self.paramSubControl = subParamController

        default:
            break
        }
    }

}
