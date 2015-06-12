//
//  ViewController.swift
//  DragGame
//
//  Created by HEWei on 15/6/11.
//  Copyright (c) 2015年 HEWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderTarget: UISlider!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var labScore: UILabel!
    @IBOutlet weak var labRound: UILabel!
    
    var targetValue :Int = 0
    var currValue :Int = 0
    var totalScore :Int = 0
    var totalRound :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        onUpate();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChange(sender: AnyObject) {
        currValue = lroundf(mySlider.value)
    }

    @IBAction func onAlert(sender: AnyObject) {
        var different = currValue - targetValue
        if (different < 0) {
            different *= -1
        }
        var points = 100 - different
        totalScore += points
        var message :String
        switch (points) {
        case 100:
            message = "太牛了，大侠的得分是：\(points)"
        case 90..<100:
            message = "大侠的得分是：\(points)"
        case 80...90:
            message = "大侠您的眼力还差点，得分是：\(points)"
        default:
            message = "您的眼里差的有点离谱了，只有\(points)分"
        }
        let alert = UIAlertView(title: "老镇帅不帅", message: message, delegate: self, cancelButtonTitle: "帅")
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
        onUpate()
    }
    
    @IBAction func reSet(sender: AnyObject) {
        currValue = 50
        totalRound = 0
        totalScore = 0
        onUpate()
    }
    
    @IBAction func onShowInfo(sender: AnyObject) {
        let controller = InfoViewController(nibName: "InfoViewController", bundle:nil)
        controller.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    func onUpate() {
        targetValue = Int(1 + arc4random() % 100)
        sliderTarget.value = Float(targetValue)
        labScore.text = String(self.totalScore)
        totalRound++;
        labRound.text = String(self.totalRound)
        mySlider.value = 50
    }
    
    

}

