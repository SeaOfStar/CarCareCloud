//
//  MoviePlayerViewController.swift
//  CarCare
//
//  Created by 吴向东 on 16/8/14.
//  Copyright © 2016年 MIBD. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class MoviePlayerViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonAction(sender: AnyObject) {
        let path = "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov"
        let url = NSURL(string: path)

        NSLog("url = \(url)")
        let playerViewController: AVPlayerViewController = AVPlayerViewController()
        playerViewController.player = AVPlayer(URL: url!)

        self.presentViewController(playerViewController, animated: true) { 
            NSLog("弹出窗口")
        }
    }


    @IBAction func kxMovieButtonAction(sender: AnyObject) {
        let path = "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov"
//        let url = NSURL(string: path)
        let kxMovie: KxMovieViewController = KxMovieViewController.movieViewControllerWithContentPath(path, parameters:nil) as! KxMovieViewController


        self.presentViewController(kxMovie, animated: true) {
            NSLog("弹出窗口")
        }
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
