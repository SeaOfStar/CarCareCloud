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

            self.reload()
        }
    }

    private func reload() {
        // 更新速度表
        self.reloadSpeedMeter()

        // 更新状态面板
        self.reloadStatusPanel()

        // 更新其他参数
        self.reloadOtherParam()
    }

    private func reloadSpeedMeter() {
        if let theDriverInfo = self.driveData {
            if let speed = theDriverInfo["speed"] {
                let speedValue = speed as! Double
                speedMeter.rate = speedValue / 260.0
                speedMeter.text = "\(speedValue)"
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
    
    private func reloadOtherParam() {

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
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

        default:
            break
        }
    }

}
