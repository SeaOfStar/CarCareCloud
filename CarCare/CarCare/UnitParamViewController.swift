//
//  UnitParamViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/3/10.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

typealias ParameterType = (title: String, key: String, convert: (AnyObject)->String?, unit: String)

func convertDoubleValue(value: AnyObject, withRate rate:Double) ->String? {
    let doubleValue = value as! Double
    return String(format: "%.2f", doubleValue * rate)
}

func convertIntValue(value: AnyObject, withRate rate:Double) ->String? {
    let intValue = value as! Int
    return String(format: "%.2f", Double(intValue) * rate)
}

func converSubDouble(value: AnyObject, subKey: String, rate: Double) -> String? {
    if let subValue = (value as! [String: Double])[subKey] {
        return String(format: "%.2f", subValue * rate)
    }
    return nil
}


class UnitParamViewController: UIViewController {

    let CellID = "参数cell"

    @IBOutlet weak var tabbar: BMOCSegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    // 当前数据
    var dataSource: [String: AnyObject]? {
        didSet {
            if dataSource != nil {
                mainDataValue = dataSource
                subDataValue = dataSource!["units"] as? [[String : AnyObject]]
            }
        }
    }

    func reloadData() {
        self.tableView.reloadData()
    }

    private var currentTypes: [ParameterType]?
    private var mainDataValue :[String: AnyObject]?
    private var subDataValue: [[String: AnyObject]]?

    var isBattery: Bool = false {
        didSet {
            self.changeCurrent()
        }
    }

    var selection: Int = 0 {
        didSet {
            self.changeCurrent()
        }
    }

    private func changeCurrent() {
        if isBattery {
            currentTypes = (selection == 0 ? batteryMain : batterySub)
        }
        else {
            currentTypes = (selection == 0 ? driveMain : driveSub)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.isBattery ? "电池详细" : "驱动器详细"

        // Do any additional setup after loading the view.
        self.tabbar.titles = ["整体", "单体1", "单体2", "单体3", "单体4"]
        self.tabbar.delegate = self

        self.reloadData()
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

    // MARK: - 数据定义区
    let batteryMain: [ParameterType]  = [
        ParameterType("总电量", "level", {(value) in return convertDoubleValue(value, withRate: 0.1)}, "%"),
        ParameterType("电池老化程度", "health", {(value) in return convertDoubleValue(value, withRate: 0.1)}, "%"),
        ParameterType("总电压", "volt", {(value) in return convertDoubleValue(value, withRate: 0.1)}, "V"),
        ParameterType("总电流", "current", {(value) in return convertDoubleValue(value, withRate: 0.1)}, "A"),
        ParameterType("总功率", "power", {(value) in return convertDoubleValue(value, withRate: 0.01)}, "kw"),
        ParameterType("充电已用时间", "", {(value) in return value as? String}, "秒"),
        ParameterType("充电剩余时间", "", {(value) in return value as? String}, "秒"),
        ParameterType("最高温度", "temperature", {(value) in return converSubDouble(value, subKey: "max", rate: 0.01)}, "˚C"),
        ParameterType("平均温度", "temperature", {(value) in return converSubDouble(value, subKey: "average", rate: 0.01)}, "˚C"),
        ParameterType("正极绝缘阻抗", "resistance", {(value) in return converSubDouble(value, subKey: "positive", rate: 1.0)}, "kΩ"),
        ParameterType("负极绝缘阻抗", "resistance", {(value) in return converSubDouble(value, subKey: "negative", rate: 1.0)}, "kΩ"),
    ]


    let batterySub: [ParameterType] = [
        ParameterType("单体编号", "no", {(value) in return value as? String}, "A"),
        ParameterType("电池状态", "status", {(value) in return ""}, ""),
        ParameterType("电池电压", "volt", {(value) in return convertDoubleValue(value, withRate: 0.001)}, "V"),
        ParameterType("电流", "current", {(value) in return convertDoubleValue(value, withRate: 0.1)}, "A"),
        ParameterType("充放电功率", "power", {(value) in return convertDoubleValue(value, withRate: 0.01)}, "kw"),
        ParameterType("温度", "temperature", {(value) in return convertDoubleValue(value, withRate: 1.0)}, "˚C"),
    ]

    let driveMain = [
        ParameterType("系统版本", "softver", {(value) in return value as? String}, ""),
        ParameterType("序列号", "sn", {(value) in return value as? String}, ""),
        ParameterType("厂家标识", "facflag", {(value) in return value as? String}, ""),
        ParameterType("主控制状态", "mainstatus", {(value) in return (value as! String) == "FREE" ? "自由运行" : "" }, ""),
        ParameterType("行车速度", "speed", {(value) in return convertDoubleValue(value, withRate: 0.1) }, "km/h"),
        ParameterType("百公里耗电", "consumption", {(value) in return convertIntValue(value, withRate: 0.1) }, "度"),
        ParameterType("剩余里程数", "remaining", {(value) in return convertIntValue(value, withRate: 1.0) }, "km"),
        ParameterType("累计行车里程数", "kilometerage", {(value) in return convertIntValue(value, withRate: 1.0) }, "km"),
        ParameterType("最大放电电流", "maxcurr", {(value) in return value as? String}, "A"),
        ParameterType("加热控制", "addtemp", {(value) in return value as? String}, ""),
        ParameterType("水温", "temperature", {(value) in return value as? String}, "˚C"),
        ParameterType("挡位", "gear", {(value) in return value as? String}, "挡"),
    ]


    let driveSub: [ParameterType] = [
        ParameterType("单体编号", "no", {(value) in return value as? String}, ""),
        ParameterType("电压", "volt", {(value) in return convertDoubleValue(value, withRate: 0.001) }, "v"),
        ParameterType("电流", "current", {(value) in return convertDoubleValue(value, withRate: 0.1) }, "A"),
        ParameterType("功率", "power", {(value) in return convertDoubleValue(value, withRate: 0.01) }, "kw"),
        ParameterType("实际电机转速", "rpm", {(value) in return convertIntValue(value, withRate: 1.0) }, "rpm"),
        ParameterType("设定电机转速", "rpmPreset", {(value) in return convertIntValue(value, withRate: 1.0) }, "rpm"),
        ParameterType("散热器温度", "temperature", {(value) in return convertDoubleValue(value, withRate: 1.0) }, "˚C"),
        ParameterType("控制状态", "status", {(value) in return value as? String}, ""),
    ]

}

extension UnitParamViewController: BMOCSegmentedControlDelegate {

    func segmentValueDidChanged(control: BMOCSegmentedControl!) {
        self.selection = control.selection
        self.reloadData()
    }

}

extension UnitParamViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (currentTypes != nil) ? currentTypes!.count : 0
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let index = indexPath.row
        let paramDefine = currentTypes![index]

        var valueDic: [String : AnyObject]? = nil

        // 取出值
        if self.selection > 0 {
            // 子数据
            valueDic = self.subDataValue?[self.selection - 1]
        }
        else {
            // 主数据
//            NSLog("self.mainDataValue = \(self.mainDataValue)")
            valueDic = self.mainDataValue
        }

        let cell = tableView.dequeueReusableCellWithIdentifier(CellID, forIndexPath: indexPath);

        let layer = cell.contentView.viewWithTag(500)!.layer
//        layer.borderColor = UIColor.clearColor().CGColor
//        layer.borderWidth = 8.0
        layer.cornerRadius = 4.0
        layer.masksToBounds = true

        let titleLabel = cell.contentView.viewWithTag(501) as! UILabel
        titleLabel.text = paramDefine.title

        let valueLabel = cell.contentView.viewWithTag(502) as! UILabel
        valueLabel.text = ""

        if let theValueDic = valueDic {
            let convert = paramDefine.convert
            if let value = theValueDic[paramDefine.key] {
                if let formatedValue = convert(value) {
                    valueLabel.text = "\(formatedValue)\(paramDefine.unit)"
                }
            }
        }

        return cell;
    }

}
