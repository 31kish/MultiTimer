//
//  ViewController.swift
//  MultiTimer
//
//  Created by 桑原慶之 on 2016/09/03.
//  Copyright © 2016年 KeishiKuwabara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setEvent();
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
//        let modalView: ModalViewController = self.storyboard?.instantiateViewControllerWithIdentifier("modal") as! ModalViewController
//        self.presentViewController(modalView, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

