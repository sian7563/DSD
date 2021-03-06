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
    @IBOutlet weak private var titleTxt: UITextField!
    @IBOutlet weak private var contentTxtView: UITextView!

    let pickerData = ["sunny" , "cloud" , "rain"]

    override func viewDidLoad() {
        super.viewDidLoad()

        weather.tintColor = .clear
        createPickerView()
        dismissPickerView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        addPost(title: titleTxt.text!, content: contentTxtView.text!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
            let button = UIBarButtonItem(title: "exit", style: .plain, target: self, action: #selector(self.action))
            toolBar.setItems([button], animated: true)
            toolBar.isUserInteractionEnabled = true
            weather.inputAccessoryView = toolBar
        }
    
    @objc private func action() {
        view.endEditing(true)
    }
    
    private func addPost(title: String, content: String) {
        HTTPClient().post(url: CommunityAPI.write.path(), params: ["title": title, "content": content], header: Header.token.header()).responseData(completionHandler: { res in
            switch res.response?.statusCode {
            case 201 :
                self.navigationController?.popViewController(animated:  true)
            case 401 :
                print("?????? ??????.")
            case 409 :
                print("body ????????? ?????????.")
            default :
                print(res.response?.statusCode ?? 0)
            }
        })
    }
}


