//
//  ViewController.swift
//  MultiTimer
//
//  Created by 桑原慶之 on 2016/09/03.
//  Copyright © 2016年 KeishiKuwabara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalViewDelegate {

    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    
    var modalView: ModalViewController! = nil
    var countTimer: Timer! = nil
    var initialTime: [String: Int] = ["minute": 0, "second": 0]
    var count: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setEvent();
        modalView = self.storyboard?.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.delegate = self
    }

    // ボタンのイベントを定義する
    func setEvent() {
        startButton.addTarget(self,
                              action: #selector(ViewController.startBUttonTouched(_:)),
                              for: UIControlEvents.touchUpInside)

        resetButton.addTarget(self,
                              action: #selector(ViewController.resetButtonTouched(_:)),
                              for: UIControlEvents.touchUpInside)
        
        selectButton.addTarget(self,
                               action: #selector(ViewController.selectButtonTouched(_:)),
                               for: UIControlEvents.touchUpInside)
    }

    // ボタンのイベントメソッド
    func startBUttonTouched(_ sender: UIButton) {
        if countTimer == nil
        {
            if initialTime["minute"] == 0 && initialTime["second"] == 0 {
                showAlert();
                return
            }
            NSLog("START")
            startButton.setTitle("STOP", for: .normal)

            countTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(ViewController.countTime(_:)),
                                         userInfo: nil,
                                         repeats: true)
        }
        else
        {
            if countTimer.isValid == true
            {
                NSLog("STOP")
                countTimer.invalidate()
                startButton.setTitle("START", for: .normal)
                countTimer = nil
            }
        }
    }

    func resetButtonTouched(_ sender: UIButton) {
        NSLog("RESET")
        minuteLabel.text = initialTime["minute"]?.description
        secondLabel.text = initialTime["second"]?.description
    }

    func selectButtonTouched(_ sender: UIButton) {
        NSLog("SELECT")
        self.present(modalView, animated: true, completion: nil)
    }

    func selectedTime(_ minute: Int, second: Int) {
        NSLog("DELEGATE")

        initialTime = [
            "minute": minute,
            "second": second
        ]

        minuteLabel.text = String(minute)
        secondLabel.text = String(second)
    }

    func countTime(_ timer: Timer) {
        NSLog("Called")

        let minute = Int(minuteLabel.text!)

        if count == 60
        {
            minuteLabel.text = String(minute! - 1)
        }

        count -= 1
        secondLabel.text = String(count)
        
        if count == 0
        {
            if Int(minuteLabel.text!) == 0
            {
                NSLog("END")
                startButton.setTitle("START", for: .normal)
                timer.invalidate()
                countTimer = nil
            }
            count = 60
        }
    }
    
    func showAlert() {

        let alert: UIAlertController = UIAlertController(title: "エラー", message: "時間が設定されていません。", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })

        alert.addAction(defaultAction)
        
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

