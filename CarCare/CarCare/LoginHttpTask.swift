//
//  LoginHttpTask.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/19.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class LoginHttpTask: NSObject {


//    static let IPAddress = "121.42.146.128"
    static let IPAddress = "114.55.129.27"
    static let port = 3000
    let urlString = "http://\(IPAddress):\(port)/user/signin/v/1"

    var name: String?
    var password: String?

    func loginWithCallback(callback: (response: NSURLResponse, token: String?) -> Void) -> Bool {

        if name?.characters.count <= 0 {
            return false
        }

        if password?.characters.count <= 0 {
            return false
        }

        let param = "username=\(name!)&password=\(password!)"

        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPBody = param.dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPMethod = "POST"

        // 拥抱URLSession吧
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate:
            nil, delegateQueue: NSOperationQueue.mainQueue())

        let downLoadTask = session.dataTaskWithRequest(request, completionHandler: {(data: NSData?, response: NSURLResponse?, error:NSError?) -> Void in

            if let theData = data {
                // 将数据解析成JSON对象
                do {
                    let receivedDic = try NSJSONSerialization.JSONObjectWithData(theData, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
                    if let token = receivedDic["result"] {
                        callback(response:response!, token: token as? String)
                    }
                } catch {}
            }
        })

        downLoadTask.resume()

        return true
    }
}
