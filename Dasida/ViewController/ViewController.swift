//
//  ViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {
    


    @IBOutlet weak private var weather: UITextField!
    @IBOutlet weak private var pickerView: UIPickerView!

    let pickerData = ["sunny" , "cloud" , "rain"]

    override func viewDidLoad() {
            super.viewDidLoad()

//        pickerView.delegate = self
//        pickerView.dataSource = self



        // Do any additional setup after loading the view.
    }


}

