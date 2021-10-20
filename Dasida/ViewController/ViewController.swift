//
//  ViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/09/28.
//

import UIKit

class ViewController: UIViewController,  UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak private var weather: UITextField!
    @IBOutlet weak private var pickerView: UIPickerView!

    let pickerData = ["sunny" , "cloud" , "rain"]

    override func viewDidLoad() {
        super.viewDidLoad()

        weather.tintColor = .clear
        createPickerView()
        dismissPickerView()
        
//        pickerView.delegate = self
//        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }


        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }


        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerData[row]
        }


        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            weather.text = pickerData[row]
        }


        func createPickerView() {
            let pickerView = UIPickerView()
            pickerView.delegate = self
            weather.inputView = pickerView
        }

        func dismissPickerView() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
            toolBar.setItems([button], animated: true)
            toolBar.isUserInteractionEnabled = true
            weather.inputAccessoryView = toolBar
        }
    
    @objc func action() {
        print("!!")
    }
}


