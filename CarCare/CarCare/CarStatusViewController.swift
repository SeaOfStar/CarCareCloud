//
//  CarStatusViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/19.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

enum OnOff: String {
    case OPEN, CLOSED, LOCKED
    case CLOSING, OPENING
    case ON, OFF
//    case PARKING, RELEASED

    func on() -> Bool {
        return (self.rawValue == OPEN.rawValue) || (self.rawValue == ON.rawValue)
    }
}

class CarStatusViewController: UIViewController {

    // IP & 端口信息
//    static let MQTTServerIP = "121.42.146.128"
    static let MQTTServerIP = "114.55.129.27"
    static let MQTTServerPort: UInt16 = 3010

    // 会话主体
    static let vehicleID: String = "5KDAZFIHCZ"
    static let vehicleChannel = "vehicle/v/1/ev/" + vehicleID
    static let vehicleControlChannel = "vehicle/control/v/1/ev/" + vehicleID

    var token: String? {
        didSet {
            reconnect()
        }
    }

    private var coreData: [String: AnyObject]? {
        didSet {
            reloadData()
        }
    }

    private var mqtt: CocoaMQTT?

    override func viewDidLoad() {
        super.viewDidLoad()

        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        if let token = app.clientID {
            self.token = token
        }
        // Do any additional setup after loading the view.

        speedMeter.unitText = "KM/H"
        angelMeter.unitText = "rpm"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - 重新建立MQTT连接
    func reconnect() {

        if let old = mqtt {
            old.disconnect()
            mqtt = nil
        }

        // 创建新的MQTT连接
        let newMqtt = CocoaMQTT(clientId: token!, host: CarStatusViewController.MQTTServerIP, port: CarStatusViewController.MQTTServerPort)
        newMqtt.delegate = self
        newMqtt.connect()

        mqtt = newMqtt
    }

    func reloadData() {
        // 更新画面
//        print(coreData)

        // 汽车数据
        if let vehicleData = coreData?["vehicle"] {
            reloadVehicleData(vehicleData as! [String : AnyObject])
        }

        // 驾驶信息
        if let driveData = coreData?["drive"] {
            reloadDriveData(driveData as! [String: AnyObject])
        }
    }

    // MARK: 驾驶信息
    func reloadDriveData(driveInfo : [String : AnyObject]) {
        if let parkingBrake = driveInfo["parkingBrake"] {
            dashboard.手刹 = (parkingBrake as! String == "PARKING")
        }

        if let speed = driveInfo["speed"] {
            let speedValue = speed as! Double
            speedMeter.rate = speedValue / 260.0
            speedMeter.text = "\(speedValue)"
        }

        // 这个地方具体的业务逻辑不太清楚，等问问翟
        if let unitsInfo = driveInfo["units"] {
            let units = unitsInfo as! [[String : AnyObject]]
            if let rpm = units.first?["rpm"] {
                let rate = rpm as! Double / 8864.0
                angelMeter.rate = rate
                angelMeter.text = "\(rpm)"
            }
        }

        print("\(driveInfo)")
    }

    // MARK:车门
    var door: DoorViewController!

    // 控制车门信息
    func reloadVehicleData(data: [String: AnyObject]) {
        // 车门信息

        if let doorInfo = data["doors"] {

            for (key, value) in doorInfo as! [String: String] {
                let status = OnOff(rawValue: value)
                let isOpen = status?.on()

                switch key {
                case "frontLeft":
                    door.左前门 = isOpen

                case "frontRight":
                    door.右前门 = isOpen

                case "rearLeft":
                    door.左后门 = isOpen

                case "rearRight":
                    door.右后门 = isOpen

                default:
                    break
                }
            }
        }

        // 灯光信息
        if let lightInfo = data["lights"] {
            reloadLight(lightInfo as! [String : AnyObject])
        }

    }

    // MARK: 仪表盘
    var dashboard: DashboardViewController!

    func reloadLight(lightInfo: [String: AnyObject]) {

        if let illumination = lightInfo["illumination"] {
            // 仪表灯
            dashboard.仪表盘灯 = OnOff(rawValue: illumination as! String)?.on()
        }
    }

    // MARK: 速度表&转速表
    var speedMeter: SpeedoMeterViewController!
    var angelMeter: SpeedoMeterViewController!


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if let idString = segue.identifier {
            switch idString {
            case "车门":
                self.door = segue.destinationViewController as! DoorViewController

            case "仪表盘":
                self.dashboard = segue.destinationViewController as! DashboardViewController

            case "时速表":
                self.speedMeter = segue.destinationViewController as! SpeedoMeterViewController

            case "转速表":
                self.angelMeter = segue.destinationViewController as! SpeedoMeterViewController

            default:
                break
            }
        }
    }

}

// MARK: - MQTT 回调处理
extension CarStatusViewController: CocoaMQTTDelegate {

    func sendInitCommand() {
        let commandString = "{\"target\":\"INIT\"}"
        let message = CocoaMQTTMessage(topic: CarStatusViewController.vehicleControlChannel, string: commandString)
        mqtt?.publish(message)
    }

    func mqtt(mqtt: CocoaMQTT, didConnect host: String, port: Int) {
        _console("didConnect \(host):\(port)")
    }


    func mqtt(mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        //print("didConnectAck \(ack.rawValue)")
        if ack == .ACCEPT {
            // 订阅车辆状态数据
            mqtt.subscribe(CarStatusViewController.vehicleChannel)
        }
    }

    func mqtt(mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        _console("didPublishMessage with message: \(message.string) on \(message.topic)")
    }

    func mqtt(mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        _console("didPublishAck with id: \(id)")
    }

    func mqtt(mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ) {
        coreData = parse(message.string!) as? [String: AnyObject]
    }

    func parse(str: String) -> AnyObject {
        if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let obj = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0));
                return obj
            } catch {

            }
        }

        return [:]
    }

    func mqtt(mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        _console("didSubscribeTopic to \(topic)")
        sendInitCommand()
    }

    func mqtt(mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        _console("didUnsubscribeTopic to \(topic)")
    }

    func mqttDidPing(mqtt: CocoaMQTT) {
        _console("didPing")
    }

    func mqttDidReceivePong(mqtt: CocoaMQTT) {
        _console("didReceivePong")
    }

    func mqttDidDisconnect(mqtt: CocoaMQTT, withError err: NSError?) {
        _console("mqttDidDisconnect: \(err!)")
    }

    private func _console(info: String) {
        print("MQTT回调: \(info)")
    }

}
