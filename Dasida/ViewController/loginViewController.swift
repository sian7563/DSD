//
//  loginViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/10/14.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signin(_ sender: Any) {
        let Username = username.text
        let Password = password.text
        
        if(Username == "" || Password == "")
        {
            return
        }
    
    }
    
    @IBAction func signup(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
             
        self.present(uvc, animated: true)
    }
}
