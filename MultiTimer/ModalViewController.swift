//
//  ModalViewController.swift
//  MultiTimer
//
//  Created by 桑原慶之 on 2016/09/04.
//  Copyright © 2016年 KeishiKuwabara. All rights reserved.
//

import UIKit

protocol ModalViewDelegate {
    func selectedTime(minute:Int, second:Int)
}

class ModalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var closeButton: UIButton!

    let timeList = [[Int](0...60), [Int](0...60)]
    var delegate: ModalViewDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimePicker()
        setEvent()
    }

    func setEvent() {
        closeButton.addTarget(self,
                              action: #selector(ModalViewController.closeButtonTouched(_:)),
                              forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setTimePicker() {
        timePicker.dataSource = self
        timePicker.delegate = self
        
        //「分」のラベルを追加
        let minuteLabel = UILabel()
        minuteLabel.text = "分"
        minuteLabel.sizeToFit()
        minuteLabel.frame = CGRectMake(timePicker.bounds.width/2 - minuteLabel.bounds.width/2 - 50,
                                       timePicker.bounds.height/2 - minuteLabel.bounds.height/2,
                                       minuteLabel.bounds.width,
                                       minuteLabel.bounds.height)
        timePicker.addSubview(minuteLabel)
        
        
        //「秒」のラベルを追加
        let secoundLabel = UILabel()
        secoundLabel.text = "秒"
        secoundLabel.sizeToFit()
        secoundLabel.frame = CGRectMake(timePicker.bounds.width*3/4 - secoundLabel.bounds.width/2 - 50,
                                        timePicker.bounds.height/2 - secoundLabel.bounds.height/2,
                                        secoundLabel.bounds.width,
                                        secoundLabel.bounds.height)
        timePicker.addSubview(secoundLabel)
    }

    func closeButtonTouched(sender: UIButton) {
        NSLog("CLOSE")
        NSLog("%d", timePicker.selectedRowInComponent(0))
        NSLog("%d", timePicker.selectedRowInComponent(1))

        self.delegate?.selectedTime(timePicker.selectedRowInComponent(0),
                                   second: timePicker.selectedRowInComponent(1))
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //コンポーネントの個数を返すメソッド
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return timeList.count
    }
    
    
    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeList[component].count
    }
    
    
    //サイズを返すメソッド
    func pickerView(pickerView: UIPickerView, widthForComponent component:Int) -> CGFloat {
        return timePicker.bounds.width * 1/4
        
    }
    
    
    //データを返すメソッド
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = NSTextAlignment.Left
        pickerLabel.text = String(timeList[component][row])
        
        return pickerLabel
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}