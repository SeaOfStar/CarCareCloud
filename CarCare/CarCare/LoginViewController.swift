//
//  LoginViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/2/18.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    static let keyForToken = "token"

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // 检查是否之前保存了token
        if let theToken = savedToken {
            // 直接跳转到主页面
            showMainWithToken(theToken)
        }
    }

    func showMainWithToken(token: String) {

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(sender: AnyObject) {

        let loginTask = LoginHttpTask()
        loginTask.name = name.text
        loginTask.password = password.text

        let check = loginTask.loginWithCallback({ (response, token) -> Void in
            if let theToken = token {
                // 将token保存起来

                let setting = NSUserDefaults.standardUserDefaults()
                setting.setObject(theToken, forKey: LoginViewController.keyForToken)
                setting.synchronize()
            }

        })

        if !check {
            let alert = UIAlertController(title: "参数不完整", message: "请完整输入用户名及密码", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "了解", style: .Default, handler: { (action) -> Void in
            })
            alert.addAction(OKAction)

            self.presentViewController(alert, animated: true, completion: { () -> Void in
                // 不需要做什么
            })
        }
    }

    var savedToken: String? {
        let setting = NSUserDefaults.standardUserDefaults()
        return setting.objectForKey(LoginViewController.keyForToken) as? String
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
