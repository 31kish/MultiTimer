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

    override func viewDidLoad() {
        super.viewDidLoad()

        setEvent();
        modalView = self.storyboard?.instantiateViewControllerWithIdentifier("modal") as! ModalViewController
        modalView.delegate = self
    }

    // ボタンのイベントを定義する
    func setEvent() {
        startButton.addTarget(self,
                              action: #selector(ViewController.startBUttonTouched(_:)),
                              forControlEvents: UIControlEvents.TouchUpInside)

        resetButton.addTarget(self,
                              action: #selector(ViewController.resetButtonTouched(_:)),
                              forControlEvents: UIControlEvents.TouchUpInside)
        
        selectButton.addTarget(self,
                               action: #selector(ViewController.selectButtonTouched(_:)),
                               forControlEvents: UIControlEvents.TouchUpInside)
    }

    // ボタンのイベントメソッド
    func startBUttonTouched(sender: UIButton) {
        NSLog("START")
    }

    func resetButtonTouched(sender: UIButton) {
        NSLog("RESET")
    }

    func selectButtonTouched(sender: UIButton) {
        NSLog("SELECT")
        self.presentViewController(modalView, animated: true, completion: nil)
    }

    func selectedTime(minute: Int, second: Int) {
        NSLog("DELEGATE")
        minuteLabel.text = String(minute)
        secondLabel.text = String(second)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

